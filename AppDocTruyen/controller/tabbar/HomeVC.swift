//
//  HomeVC.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/18/22.
//

import UIKit
import CoreData

class HomeVC:  BaseViewController {
    var arrCate = [NSManagedObject]()
    var arrTruyenHay = [NSManagedObject]()
    var timer: Timer?
    var currentCellIndex = 0
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionImg: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    
    
    func setupView(){
        setupCollectionView()
        setupSlideImg()
    }
    
    func setupSlideImg() {
        collectionImg.delegate = self
        collectionImg.dataSource = self
        let nib = UINib(nibName: "ImgColCell", bundle: nil)
        collectionImg.register(nib, forCellWithReuseIdentifier: "imgColCell")
        timer =  Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        pageController.numberOfPages = arrTruyenHay.count
        
        collectionImg.reloadData()
        
    }
    @objc func slideToNext(){
        if currentCellIndex < arrTruyenHay.count - 1 {
            currentCellIndex = currentCellIndex + 1
        }else {
            currentCellIndex = 0
        }
        pageController.currentPage = currentCellIndex
        collectionImg.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        if arrTruyenHay.count != collectionImg.numberOfItems(inSection: 0){
            collectionImg.reloadData()
        }
       
        
    }
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "TruyenColCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "truyenColCell")
    }
    

}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return arrTruyenHay.count}
        else{
            return arrTruyenHay.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = arrTruyenHay[indexPath.item]
        
        if collectionView == self.collectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "truyenColCell", for: indexPath) as! TruyenColCell
        
        cell.lbTitle.text = data.value(forKey: "title") as? String
        
        // COVERT URL TO STRING
        let fileUrl = URL(string: data.value(forKey: "img") as! String)!
        // SHOW IMAGE BY URL
        if let data = try? Data(contentsOf: fileUrl){
            if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    cell.imgTruyen.image = image
                }
            }
        }
        
        cell.collectionUiView.layer.borderWidth = 0
        cell.collectionUiView.layer.borderColor = UIColor.black.cgColor
        cell.collectionUiView.layer.cornerRadius = 8
        cell.collectionUiView.layer.masksToBounds = true
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgColCell", for: indexPath) as! ImgColCell
            // COVERT URL TO STRING
            let fileUrl = URL(string: data.value(forKey: "img" ?? "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/273212779_3087044688233215_3522217186260154164_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=BuqYtBa34-gAX_BYV-E&_nc_oc=AQl7FHCMDBURsWSV-ko33eR3AXQpbbAkKQMzRua8XWaxu5WoBD0xq7lwlb_8pe1HL0g&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-DKzKIn3zu6EtdC7KAqJlJtj4B3zeBLgx1IT3uXm-p2g&oe=623FA3CD") as! String)!
            // SHOW IMAGE BY URL
            if let data = try? Data(contentsOf: fileUrl){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        cell.imgTruyen.image = image
                    }
                }
            }
            
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (view.frame.width - 30) / 3
        return CGSize(width: w, height: w)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        vc.arrTruyen = arrTruyenHay
        vc.arrCate = arrCate
        vc.indexCate =  arrTruyenHay[indexPath.row].value(forKey: "cateId") as! Int - 1
        vc.index = indexPath.row
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    
}






