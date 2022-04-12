//
//  DocTruyenVC.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/22/22.
//

import UIKit
import CoreData

class DocTruyenVC: UIViewController {
    var slider  = UISlider()
    var arrCate = [NSManagedObject]()
    var arrTruyen = [NSManagedObject]()
    var index = 0
    
    @IBOutlet weak var sliderToZoomFont: UISlider!{
        didSet{
            sliderToZoomFont.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        }
    }
    @IBOutlet weak var lbTacgia: UILabel!
    @IBOutlet weak var lbContent: UITextView!
    @IBOutlet weak var lbTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupSlider()
    }
    
    func setupView() {
        lbTitle.text = arrTruyen[index].value(forKey: "title") as? String
        lbTacgia.text = arrTruyen[index].value(forKey: "tacgia") as? String
        lbContent.textColor = UIColor.darkText
        lbContent.font = UIFont(name: "Noteworthy", size: CGFloat(18))
        lbContent .text = (arrTruyen[index].value(forKey: "content") as! String)
    }
    
    func setupSlider() {
        sliderToZoomFont.minimumValue = 15
        sliderToZoomFont.maximumValue = 35
        sliderToZoomFont.value = 18
        sliderToZoomFont.setValue(sliderToZoomFont.value, animated: true)
        sliderToZoomFont.addTarget(self, action: #selector(scrollFontSize), for: .valueChanged)
    }
    
    @objc func scrollFontSize(){
        lbContent.font = UIFont(name: "Noteworthy", size: CGFloat(sliderToZoomFont.value))
        print(sliderToZoomFont.value)
        
    }


    @IBAction func tapOnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
