//
//  Truyenhay.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/18/22.
//

import UIKit
import CoreData
class Truyenhay: BaseViewController {
    var index = 1
    var arrTruyenHay = [NSManagedObject]()
    var arrCate = [NSManagedObject]()
    var arr = [NSManagedObject]()
    @IBOutlet weak var collectionViewCate: UICollectionView!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewCate()
        setupTableView()
        
    }
    //AUTO SELECT ITEM  = 0
//    override func viewDidAppear(_ animated: Bool) {
//        let indexPath = NSIndexPath(item: 0, section: 0)
//        collectionView(collectionViewCate, didSelectItemAt: indexPath as IndexPath)
//        var cell =  collectionViewCate.dequeueReusableCell(withReuseIdentifier: "cateMenuColCell", for: indexPath as IndexPath) as! CateMenuColCell
//        cell = collectionViewCate.cellForItem(at: indexPath as IndexPath)! as! CateMenuColCell
//        cell.lbCateMenu.textColor = UIColor.darkGray
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopAnimating()
    }

    
    func setupCollectionViewCate(){
       
        collectionViewCate.delegate = self
        collectionViewCate.dataSource = self
        let nib1 = UINib(nibName: "CateMenuColCell", bundle: nil)
        collectionViewCate.register(nib1, forCellWithReuseIdentifier: "cateMenuColCell")
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        
    }
    
   
    
}

//COLLECTION VIEW
extension Truyenhay: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cellCate =  collectionViewCate.dequeueReusableCell(withReuseIdentifier: "cateMenuColCell", for: indexPath) as! CateMenuColCell
            cellCate.lbCateMenu.text = arrCate[indexPath.item].value(forKey: "cateName") as? String
            cellCate.lbCateMenu.layer.borderWidth = 0
            cellCate.lbCateMenu.layer.borderColor = UIColor.black.cgColor
            cellCate.lbCateMenu.layer.cornerRadius = 8
            cellCate.lbCateMenu.layer.masksToBounds = true
            return cellCate
}
    // DID SELECT
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var cell =  collectionViewCate.dequeueReusableCell(withReuseIdentifier: "cateMenuColCell", for: indexPath) as! CateMenuColCell
        cell = collectionViewCate.cellForItem(at: indexPath)! as! CateMenuColCell
        cell.lbCateMenu.textColor = UIColor.darkGray
        var cateId = arrCate[indexPath.item].value(forKey: "cateId") as! Int
        index = cateId
        print(cateId)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Truyen")
        fetchRequest.predicate = NSPredicate(format: "cateId = %@ AND danhgia = %@", argumentArray: ["\(cateId)","1"])
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            arrTruyenHay = result
            for data in result {
                managedContext.refresh(data, mergeChanges: true)
            }
        } catch  {
            print("faild !!!")
        }
        
        guard let appDelegate1 = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext1 = appDelegate1.persistentContainer.viewContext
        let fetchRequest1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        fetchRequest1.predicate = NSPredicate(format: "cateId == %@", "\(cateId)")
        do {
            let result = try managedContext1.fetch(fetchRequest1) as! [NSManagedObject]
            arr = result
            for data in result {
                managedContext1.refresh(data, mergeChanges: true)
            }
        } catch  {
            print("faild !!!")
        }
        
        tableView.reloadData()
        
    }
   
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        var cell =  collectionViewCate.dequeueReusableCell(withReuseIdentifier: "cateMenuColCell", for: indexPath) as! CateMenuColCell
        
        cell = collectionViewCate.cellForItem(at: indexPath)! as! CateMenuColCell
        cell.lbCateMenu.textColor = UIColor.white
    }

}

// TABLE VIEW
extension Truyenhay : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrTruyenHay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableCell
        
        let data = arrTruyenHay[indexPath.row]
       
        cell.lbTruyen.text = data.value(forKey: "title") as? String
        let fileUrl = URL(string: data.value(forKey: "img") as! String)!
        // SHOW IMAGE BY URL
        if let data = try? Data(contentsOf: fileUrl){
            if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    cell.imgTruyen.image = image
                }
            }
        }
        cell.lbTacgia.text = data.value(forKey: "tacgia") as? String
        cell.lbTheloai.text = arrCate[index - 1].value(forKey: "cateName") as? String
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        startAnimating()
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        vc.arrTruyen = arrTruyenHay
        vc.index = indexPath.row
        var index = arrTruyenHay[indexPath.row].value(forKey: "cateId") as! Int
        vc.indexCate = index - 1
        vc.arrCate = arrCate
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)
    }
}
