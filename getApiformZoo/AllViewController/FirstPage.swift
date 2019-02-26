//
//  FirstPage.swift
//  getApiformZoo
//
//  Created by HsiungWei on 2019/2/21.
//  Copyright © 2019 熊偉. All rights reserved.
//

import UIKit



class FirstPage: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tbv: UITableView!
    var item = [JSONData.animals]()
    
    var apiZoo = "https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=a3e2b221-75e0-45c1-8f97-75acbd43d613"
    var urlSession = URLSession(configuration: .default)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tbv.rowHeight = 100
        downLoadInfo(wedAddress: apiZoo)
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return item.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForZoo", for: indexPath) as? Cell
        cell?.userName.text = item[indexPath.row].A_Name_Ch
        cell?.userTitle.text = item[indexPath.row].A_Family
        
        
        return cell!
    }
    
    func downLoadInfo(wedAddress:String) {
        
        if let url = URL(string: wedAddress) {
            let task = urlSession.dataTask(with: url, completionHandler: {
                (data,responds,error) in
                if error != nil {
                    let errorCode = (error! as NSError).code
                    if errorCode == -1009 {
                        self.settingAlert(title: "目前沒網路")
                    }else {
                        print("抱歉")
                    }
                    return
                }
                
                if let loadData = data {
                    
                    do {
                        
                        
                        let okData = try JSONDecoder.init().decode(JSONData.self, from: loadData)
                        
                        self.item = okData.result.results
                        
                        
                        DispatchQueue.main.async {
                            self.tbv.reloadData()
                        }
                        
                    }catch {
                        
                        print(error)
                        
                    }
                    
                }
                
            })
            task.resume()
        }
        
        
    }
    
    func settingAlert(title:String)  {
        let alert = UIAlertController(title: title, message: "請稍後再試", preferredStyle: .alert)
        let okAction = alert.addAction(UIAlertAction(title: "點一下確認", style: .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        let vc = segue.destination as! DetailVC
        if let indexPath = tbv.indexPathForSelectedRow {
            vc.item = [item[indexPath.row]]
           
        }
        
     }
    
    
}
