//
//  TabbarVC.swift
//  AppDocTruyen
//
//  Created by SAN10 on 3/20/22.
//

import UIKit
import CoreData

class TabbarVC: UITabBarController {
    var arrImgTruyenHay = [NSManagedObject]()
    var arrTruyen = [NSManagedObject]()
    var arrCate = [NSManagedObject]()
    var arrTruyenHay = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        //updateTruyenInCoreData()
        //deleteAllObject()
        setTruyenToCoreData()
      //  setCateToCoreData()
        getTruyenFromCoreData()
        getTruyenHayFromCoreData()
        getCateFromCoreData()
        passDataToOtherScreen()
        print("dau tien" )
    }
    
    
    // SET TRUYEN VAO CORE DATA
    func setTruyenToCoreData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let truyenEntity = NSEntityDescription.entity(forEntityName: "Truyen", in:  managedContext)
        
        let truyen = NSManagedObject(entity: truyenEntity!, insertInto: managedContext)
        // tacgia
        truyen.setValue("Trương Nghệ Mưu", forKey: "tacgia")
        // title
        truyen.setValue("Thiên thần và bóng tối", forKey: "title")
        // content
        truyen.setValue("Khi còn là những đứa trẻ, chúng ta thường bị ép buộc phải tha thứ cho lỗi lầm của người khác. Nếu một đứa bé cướp đồ chơi của bạn mình, cha mẹ sẽ bắt chúng phải xin lỗi và tha thứ cho nhau. Lời xin lỗi đó được coi là tuyên ngôn của sự tha thứ. Tuy nhiên, sự hằn học và mâu thuẫn thì vẫn có thể còn đang chất chứa trong lòng.Tôi viết những dòng này gửi tặng các bạn trẻ đang căng tràn nhựa sống, sục sôi ý chí “trở thành một ai đó” trong tương lai để thành công, hạnh phúc hay đơn giản chỉ là có thật nhiều những niềm vui. Tôi chỉ là một anh thợ dán quảng cáo ngoài trời khô khan, cục mịch chứ không phải một nhà văn. Chính bởi vậy, đọc những chia sẻ của tôi đôi khi các bạn sẽ cảm thấy dật cục, khó thuận nguồn cảm hứng, ráng nhé! Ngày xưa, có một vị vua cai trị cả một vương quốc rộng lớn. Một ngày nọ, ông quyết định vi hành đến những vùng đất xa xôi nhất của đất nước. Khi trở về cung điện, ông phàn nàn rằng chân ông rất đau. Điều này cũng hoàn toàn dễ hiểu, bởi đây là lần đầu tiên ông thực hiện một chuyến đi dài như vậy, trong khi đó, những con đường ông đi qua đều gập ghềnh, sỏi đá. Bực mình vì bị những cơn nhức mỏi hành hạ, ông ra lệnh cho tất cả các con đường trong vương quốc phải được bao phủ bằng da súc vật. Tất nhiên đây là một mệnh lệnh rất khó thực hiện và tốn kém cả về sức người, sức của nhưng vẫn không ai dám khuyên can nhà vua. Ngày xưa, có một nhà làm nghề buôn bán, gian tham chế ra một cái cân cán rỗng, trong đổ thủy ngân, hai đầu bịt đồng, không ai biết. Khi cân hàng bán cho người ta thì dốc cán về đằng móc, còn khi cân hàng mua của ai thì dốc cán cân về đằng quả. Như vậy một cái cân vừa nặng vừa nhẹ được, và bao giờ phần lợi cũng về mình.Chuyện kể rằng lúc Quỳnh còn nhỏ, mới bảy tám tuổi, Quỳnh đã tỏ ra thông minh đỉnh ngộ nhưng cũng là một đứa trẻ chúa nghịch. Hồi ấy bọn trẻ thường chơi trò xước xách, lấy tàu chuối làm cờ, lá sen làm lọng. Trong trò chơi, Quỳnh bao giờ cũng lấn lướt. Cô đi ngang qua một con hẻm tối tăm, vừa đi ngang cô ngửi thấy mùi máu tanh nồng nặc truyền ra từ con hẻm, mũi cô rất nhạy có thể ngửi ra bất cứ mùi nào, từ rất xa cô đã có thể ngửi được. Cô bước vào trong con hẻm âm u ấy, mùi máu càng nồng hơn, thấp thoáng cô nhìn thấy bóng người đang nằm dưới đất, cô tiến lại gần hơn nữa nhìn thấy người đang nằm dưới đất kia là một người đàn ông toàn thân máu me, gương mặt anh ta ngũ quan tinh xảo, nước da trắng ngần đôi mày lưỡi kiếm, hàng mi dài, cong vút có thể nói vẻ đẹp của anh chính là bức tranh tuyệt tác của thần thánh. Cô ngồi xổm xuống lay nhẹ người anh ta, anh ta có chút phản ứng mắt hé mở trong mờ ảo anh nhìn thấy một cô gái vô cùng xinh đẹp động lòng người, môi mấp máy gì đó rồi rơi vào hôn mê.Chúng tôi vừa trải qua kì thi cuối học kì I, dường như ai cũng cho phép bản thân được nghỉ xả hơi sau những ngày căng thẳng.Tôi biết cái tên này, cậu ta học giỏi nhất nhì khối và luôn thi chung phòng với tôi. Tôi vẫn còn ấn tượng với những lần cậu ta nộp bài sớm nhất phòng thi và gần như đều đạt số điểm tuyệt đối. Tôi không hề quen với Quốc Anh, không ngờ cậu ta lại làm quen bằng cái cách đầy trêu đùa và giễu cợt như thế này. Tôi hằn học gấp mạnh cuốn sách, trong lòng có chút khó chịu.Tôi bỏ vào lớp. cậu cũng không còn đứng đó. Về đến chỗ bỏ ba lô xuống, tôi mới cảm thấy hơi phấp phỏm lo lắng. Sẽ chẳng có gì đáng lo nếu đó là thư tình tôi chưa kịp gửi đi. Bây giờ ngoài bản thân tôi còn có một người khác biết tình cảm đơn phương này, người đó lại là Quốc Anh, thế lại càng đáng lo hơn.Truyện Vùng Đất Vô Hình là một truyện khá lý thú và hấp dẫn của tác giả Thám Hoa Rách, truyện có nhiều yếu tố kinh dị được vẽ lên, tô đậm làm người khác cảm thấy hoảng sợ, không gian rùng rợn của truyện làm bạn đọc cảm thấy ngỡ ngàng, bị cuốn vào nhưng nửa muốn thoát ra, có chút huyền bí huyễn hoặc pha thêm chút ma quái đôi khi lại làm cho người đọc như bị dụ hoặc.Chúng tôi vừa trải qua kì thi cuối học kì I, dường như ai cũng cho phép bản thân được nghỉ xả hơi sau những ngày căng thẳng.Tôi biết cái tên này, cậu ta học giỏi nhất nhì khối và luôn thi chung phòng với tôi. Tôi vẫn còn ấn tượng với những lần cậu ta nộp bài sớm nhất phòng thi và gần như đều đạt số điểm tuyệt đối. Tôi không hề quen với Quốc Anh, không ngờ cậu ta lại làm quen bằng cái cách đầy trêu đùa và giễu cợt như thế này. Tôi hằn học gấp mạnh cuốn sách, trong lòng có chút khó chịu.Tôi bỏ vào lớp. cậu cũng không còn đứng đó. Về đến chỗ bỏ ba lô xuống, tôi mới cảm thấy hơi phấp phỏm lo lắng. Sẽ chẳng có gì đáng lo nếu đó là thư tình tôi chưa kịp gửi đi. Bây giờ ngoài bản thân tôi còn có một người khác biết tình cảm đơn phương này, người đó lại là Quốc Anh, thế lại càng đáng lo hơn.Truyện Vùng Đất Vô Hình là một truyện khá lý thú và hấp dẫn của tác giả Thám Hoa Rách, truyện có nhiều yếu tố kinh dị được vẽ lên, tô đậm làm người khác cảm thấy hoảng sợ, không gian rùng rợn của truyện làm bạn đọc cảm thấy ngỡ ngàng, bị cuốn vào nhưng nửa muốn thoát ra, có chút huyền bí huyễn hoặc pha thêm chút ma quái đôi khi lại làm cho người đọc như bị dụ hoặc.Chúng tôi vừa trải qua kì thi cuối học kì I, dường như ai cũng cho phép bản thân được nghỉ xả hơi sau những ngày căng thẳng.Tôi biết cái tên này, cậu ta học giỏi nhất nhì khối và luôn thi chung phòng với tôi. Tôi vẫn còn ấn tượng với những lần cậu ta nộp bài sớm nhất phòng thi và gần như đều đạt số điểm tuyệt đối. Tôi không hề quen với Quốc Anh, không ngờ cậu ta lại làm quen bằng cái cách đầy trêu đùa và giễu cợt như thế này. Tôi hằn học gấp mạnh cuốn sách, trong lòng có chút khó chịu.Tôi bỏ vào lớp. cậu cũng không còn đứng đó. Về đến chỗ bỏ ba lô xuống, tôi mới cảm thấy hơi phấp phỏm lo lắng. Sẽ chẳng có gì đáng lo nếu đó là thư tình tôi chưa kịp gửi đi. Bây giờ ngoài bản thân tôi còn có một người khác biết tình cảm đơn phương này, người đó lại là Quốc Anh, thế lại càng đáng lo hơn.Truyện Vùng Đất Vô Hình là một truyện khá lý thú và hấp dẫn của tác giả Thám Hoa Rách, truyện có nhiều yếu tố kinh dị được vẽ lên, tô đậm làm người khác cảm thấy hoảng sợ, không gian rùng rợn của truyện làm bạn đọc cảm thấy ngỡ ngàng, bị cuốn vào nhưng nửa muốn thoát ra, có chút huyền bí huyễn hoặc pha thêm chút ma quái đôi khi lại làm cho người đọc như bị dụ hoặc.", forKey: "content")
        // image
        truyen.setValue("https://img.thichtruyen.vn/data/anh-truyen/12/thien-than-bong-toi.jpg", forKey: "img")
        // cate id
        truyen.setValue(6 , forKey: "cateId")
        // danh gia
        truyen.setValue("1", forKey: "danhgia")
        // mota
        truyen.setValue("Tha thứ là gì? Tha thứ là một lời nói hay là sự buông bỏ thù hận từ trong tâm? Hãy đọc câu chuyện dưới đây và cùng suy ngẫm. Khi còn là những đứa trẻ, chúng ta thường bị ép buộc phải tha thứ cho lỗi lầm của người khác. Nếu một đứa bé cướp đồ chơi của bạn mình, cha mẹ sẽ bắt chúng phải xin lỗi và tha thứ cho nhau. Lời xin lỗi đó được coi là tuyên ngôn của sự tha thứ. Tuy nhiên, sự hằn học và mâu thuẫn thì vẫn có thể còn đang chất chứa trong lòng.Bạn đang đọc truyện Này Bác Sĩ Hư Hỏng Em Yêu Anh của tác giả Hường. Một đêm điên cuồng, Hạ Nhược Vũ tỉnh dậy thấy mình bên cạnh một người đàn ông xa lạ. Tưởng rằng ai đi đường nấy, ai ngờ, chỉ vài tiếng sau họ lại trớ trêu gặp lại nhau ở... phòng khám phụ khoa...TCô đi ngang qua một con hẻm tối tăm, vừa đi ngang cô ngửi thấy mùi máu tanh nồng nặc truyền ra từ con hẻm, mũi cô rất nhạy có thể ngửi ra bất cứ mùi nào, từ rất xa cô đã có thể ngửi được. Cô bước vào trong con hẻm âm u ấy, mùi máu càng nồng hơn, thấp thoáng cô nhìn thấy bóng người đang nằm dưới đất, cô tiến lại gần hơn nữa nhìn thấy người đang nằm dưới đất kia là một người đàn ông toàn thân máu me, gương mặt anh ta ngũ quan tinh xảo, nước da trắng ngần đôi mày lưỡi kiếm, hàng mi dài, cong vút có thể nói vẻ đẹp của anh chính là bức tranh tuyệt tác của thần thánh. Cô ngồi xổm xuống lay nhẹ người anh ta, anh ta có chút phản ứng mắt hé mở trong mờ ảo anh nhìn thấy một cô gái vô cùng xinh đẹp động lòng người, môi mấp máy gì đó rồi rơi vào hôn mê.", forKey: "mota")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("could not save \(error)")
        }
    }
    
    // SET CATE VAO COREDATA
    func setCateToCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let cateEntity = NSEntityDescription.entity(forEntityName: "Category", in:  managedContext)
        
        let cate = NSManagedObject(entity: cateEntity!, insertInto: managedContext)
//        cate.setValue("Truyện tình cảm", forKey: "cateName")
//        cate.setValue(1, forKey: "cateId")
//        cate.setValue("Truyện ma", forKey: "cateName")
//        cate.setValue(2, forKey: "cateId")
//        cate.setValue("Truyện cười", forKey: "cateName")
//        cate.setValue(3, forKey: "cateId")
//        cate.setValue("Tiểu thuyết", forKey: "cateName")
//        cate.setValue(4, forKey: "cateId")
//        cate.setValue("Truyện dân gian", forKey: "cateName")
//        cate.setValue(5, forKey: "cateId")
//        cate.setValue("Truyện xã hội", forKey: "cateName")
//        cate.setValue(6, forKey: "cateId")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("could not save \(error)")
        }
    }
    
    
// GET DATA TRUYEN
    func getTruyenFromCoreData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Truyen")
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            arrTruyen = result
            
            for data in result {
                managedContext.refresh(data, mergeChanges: true)
            }
        } catch  {
            print("faild !!!")
        }
    }
    
    
    //UPDATE TRUYEN
    
    func updateTruyenInCoreData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Truyen")
        fetchRequest.predicate = NSPredicate(format: "title = %@", "Bãi đất hoang sau nhà")
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            let objecUpdate = result[0]
            objecUpdate.setValue("https://isach.info/images/story/cover/bai_dat_hoang_sau_nha__nguyen_ngoc_ngan.jpg", forKey: "img")
            
        do {
            try managedContext.save()
        
        }
            catch {
                print(error)
            }
            
        }
            catch  {
            print("faild !!!")
        }
    
        
    }
    
    
    // GET DATA TRUYEN HAY
    func getTruyenHayFromCoreData(){
        guard let appDelegate1 = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext1 = appDelegate1.persistentContainer.viewContext
        let fetchRequest1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Truyen")
        fetchRequest1.predicate = NSPredicate(format: "danhgia == %@", "1")
        do {
            let result = try managedContext1.fetch(fetchRequest1) as! [NSManagedObject]
            arrTruyenHay = result
            for data in result {
                managedContext1.refresh(data, mergeChanges: true)
            }
        } catch  {
            print("faild !!!")
        }
    }
    
    //GET CATE 
    func getCateFromCoreData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            arrCate = result
            
            for data in result {
                managedContext.refresh(data, mergeChanges: true)
            }
        } catch  {
            print("faild !!!")
        }
    }
    
    // XOA HET
    func deleteAllObject() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                    // lấy Managed Object Context
                    let managedContext = appDelegate.persistentContainer.viewContext
                    // Create Fetch Request
                    let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Truyen")
                    // Initialize Batch Delete Request
                    let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
                    
                    do {
                        // execute delete
                        try managedContext.execute(deleteRequest)
                        // save
                        try managedContext.save()
                    } catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
    }
    
    func passDataToOtherScreen() {
        let scr1 = self.viewControllers?[0] as! HomeVC
        scr1.arrTruyenHay = arrTruyenHay
        scr1.arrCate = arrCate
        let scr2 = self.viewControllers?[1] as! Truyenhay
        scr2.arrCate = arrCate
        scr2.arrTruyenHay = arrTruyenHay
        let scr3 = self.viewControllers?[2] as! TheLoaiVC
        scr3.arrCate = arrCate
        scr3.arrTruyen = arrTruyen
        let scr4 = self.viewControllers?[3] as! SearchVC
        scr4.arrTruyen = arrTruyen
        scr4.arrCate = arrCate
        
    }

}

 

extension TabbarVC : UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
       //print(item)


    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)

        if selectedIndex == 0 {
           let bas = BaseViewController()
            bas.startAnimating()
           
           
    }
}

}
