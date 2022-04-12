//
//  TongHopTruyenVC.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/23/22.
//

import UIKit
import CoreData

class TongHopTruyenVC: BaseViewController {
    //var arrTruyendoc = [NSManagedObject]()
    @IBOutlet weak var lbCateHeader: UILabel!
    var index = 0
    var arrTruyen = [NSManagedObject]()
    var arrCate = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getData()
        setupTableView()
        lbCateHeader.text = arrCate[index - 1].value(forKey: "cateName") as! String
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        stopAnimating()
    }
    
    func getData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Truyen")
        fetchRequest.predicate = NSPredicate(format: "cateId == %@", "\(index)")
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            arrTruyen = result
            for data in result {
                print(data)
                managedContext.refresh(data, mergeChanges: true)
            }
        } catch  {
            print("faild !!!")
        }
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
    }
   
    @IBAction func tapOnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension TongHopTruyenVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTruyen.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableCell
        var data = arrTruyen[indexPath.row]
        cell.lbTruyen.text = data.value(forKey: "title") as! String
        cell.lbTacgia.text = data.value(forKey: "tacgia") as! String
        let fileUrl = URL(string: data.value(forKey: "img") as! String)!
        // SHOW IMAGE BY URL
        if let data = try? Data(contentsOf: fileUrl){
            if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    cell.imgTruyen.image = image
                }
            }
        }
        cell.lbTheloai.text = arrCate[index - 1].value(forKey: "cateName") as! String
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        startAnimating()
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        vc.arrTruyen = arrTruyen
        vc.indexCate = arrTruyen[indexPath.row].value(forKey: "cateId") as! Int - 1
        vc.arrCate = arrCate
        vc.index = indexPath.row
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)

    }
    
    
}


