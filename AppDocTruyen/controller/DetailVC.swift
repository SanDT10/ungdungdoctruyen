//
//  DetailVC.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/21/22.
//

import UIKit
import CoreData

class DetailVC: BaseViewController {
    @IBOutlet weak var tbDoctruyen: UIButton!
    @IBOutlet weak var lbGioithieu: UILabel!
    var arrTruyen = [NSManagedObject]()
    var index = 0
    var indexCate = 0
    var arrCate = [NSManagedObject]()
    @IBOutlet weak var tvGioithieu: UITextView!
    @IBOutlet weak var lbTruyen: UILabel!
    @IBOutlet weak var lbTheloai: UILabel!
    @IBOutlet weak var lbTacgia: UILabel!
    @IBOutlet weak var imgTruyen: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        roundCorner(views: [tbDoctruyen,lbGioithieu], radius: 12)
        roundCorner(views: [imgTruyen], radius: 5)
    }
    
    func setupView() {
        lbTruyen.text = arrTruyen[index].value(forKey: "title") as? String
        
               let fileUrl = URL(string: arrTruyen[index].value(forKey: "img") as! String)!
               // SHOW IMAGE BY URL
               if let data = try? Data(contentsOf: fileUrl){
                   if let image = UIImage(data: data){
                       DispatchQueue.main.async {
                           self.imgTruyen.image = image
                       }
                   }
               }
        lbTheloai.text = arrCate[indexCate].value(forKey: "cateName") as? String
        lbTacgia.text = arrTruyen[index].value(forKey: "tacgia") as! String
        tvGioithieu.text = arrTruyen[index].value(forKey: "mota") as! String
    }
  
    @IBAction func tapOnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapOnDocTruyen(_ sender: Any) {
        let vc = DocTruyenVC(nibName: "DocTruyenVC", bundle: nil)
        vc.arrTruyen = arrTruyen
        vc.index = index
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(vc, animated: true, completion: nil)
        
        
        
    }
    
}
