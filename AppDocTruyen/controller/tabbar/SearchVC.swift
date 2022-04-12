//
//  SearchVC.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/24/22.
//

import UIKit
import CoreData
class SearchVC: UIViewController {
    var searching = false
    var arrTruyen =  [NSManagedObject]()
    var newArr = [NSManagedObject]()
    var arrCate = [NSManagedObject]()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupTableView()
        setupSeachBar()
       
    }
    

    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib =  UINib(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        
    }
    
    func setupSeachBar(){
        searchBar.delegate = self
    }

}

extension SearchVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == false {
            return arrTruyen.count
        }else  {
            return newArr.count
        }
        
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableCell
        var data : NSManagedObject?
        if searching == false{
             data = arrTruyen[indexPath.row]
        }else {
             data = newArr[indexPath.row]
        }
        
        cell.lbTruyen.text = data?.value(forKey: "title") as! String
        let fileUrl = URL(string: data?.value(forKey: "img") as! String)!
        // SHOW IMAGE BY URL
        if let data = try? Data(contentsOf: fileUrl){
            if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    cell.imgTruyen.image = image
                }
            }
        }
        cell.lbTacgia.text = data!.value(forKey: "tacgia") as! String
        var index =  arrTruyen[indexPath.row].value(forKey: "cateId") as! Int
        cell.lbTheloai.text = arrCate[index - 1].value(forKey: "cateName") as! String
        return cell
    
    
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        if searching == false {
            newArr = arrTruyen
            vc.arrTruyen = newArr
            vc.index = indexPath.row
            var index = arrTruyen[indexPath.row].value(forKey: "cateId")  as!  Int
            vc.indexCate = index - 1
            vc.arrCate = arrCate
            
        }else {
            vc.arrTruyen = newArr
            vc.index = indexPath.row
            var index = arrTruyen[indexPath.row].value(forKey: "cateId")  as!  Int
            vc.indexCate = index - 1
            vc.arrCate = arrCate
        }
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)

    }
    
    
}
extension SearchVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            
             newArr = arrTruyen
            
        }else {
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Truyen")
            fetchRequest.predicate = NSPredicate(format: "title contains[c] %@", "\(searchText)")
            do {
                let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
                newArr = result
                for data in result {
                    print(data)
                    managedContext.refresh(data, mergeChanges: true)
                }
            } catch  {
                print("faild !!!")
            }
            searching = true
           
        }
        
        tableView.reloadData()
    }
}
