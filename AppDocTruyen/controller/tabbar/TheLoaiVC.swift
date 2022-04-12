//
//  TheLoaiVC.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/20/22.
//

import UIKit
import CoreData
class TheLoaiVC: BaseViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var arrCate = [NSManagedObject]()
    var arrTruyen = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
       
    }
    override func viewDidDisappear(_ animated: Bool) {
        stopAnimating()
    }
   
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CateColCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cateColCell")
    }
}

extension TheLoaiVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cateColCell", for: indexPath) as! CateColCell
        cell.lbCate.text = arrCate[indexPath.item].value(forKey: "cateName") as? String
        cell.lbCate.layer.borderWidth = 0
        cell.lbCate.layer.borderColor = UIColor.black.cgColor
        cell.lbCate.layer.cornerRadius = 8
        cell.lbCate.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (view.frame.width - 30) / 2
        return CGSize(width: w, height: w)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        startAnimating()
        let index = arrCate[indexPath.item].value(forKey: "cateId") as! Int
        let vc = TongHopTruyenVC(nibName: "TongHopTruyenVC", bundle: nil)
        vc.index = index
        vc.arrCate = arrCate
        vc.arrTruyen = arrTruyen
        print("\(index)")
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)
        
        
    }
    
    
}
