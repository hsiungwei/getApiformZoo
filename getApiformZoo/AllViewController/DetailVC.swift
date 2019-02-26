//
//  DetailVC.swift
//  getApiformZoo
//
//  Created by HsiungWei on 2019/2/24.
//  Copyright © 2019 熊偉. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var testInfo: UILabel!
    var item = [JSONData.animals]()
    var urlSession = URLSession(configuration: .default)

    @IBOutlet weak var testImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if item[0].A_Interpretation == "" {
            testInfo.text = item[0].A_Feature
        } else {
            testInfo.text = item.first?.A_Interpretation
        }
        
        
       let imageAddress = item[0].A_Pic02_URL
        print(imageAddress)
        
        if let imageUrl = URL(string: imageAddress) {
            let task = urlSession.downloadTask(with: imageUrl, completionHandler: {
                (url,response,error) in
                    if error != nil {
                      
                        return
                    }
            
                do {
                if let okUrl = url {
                    let downLoadImage = UIImage(data: try Data(contentsOf: okUrl))
                    DispatchQueue.main.async {
                        self.testImage.image = downLoadImage
                        }
                }
                }catch {
                    
                }
            })
        task.resume()
        }
        
       

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
