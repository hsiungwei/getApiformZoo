//
//  ApiStruct.swift
//  getApiformZoo
//
//  Created by HsiungWei on 2019/2/21.
//  Copyright © 2019 熊偉. All rights reserved.
//

import Foundation


struct JSONData:Codable {

    var result:SingleData

      struct SingleData:Codable{
        
        var limit:Double
        var sort:String
        var results:[animals]
        
    }
    
    struct animals:Codable {
        
        var A_Name_Ch:String
        var A_Family:String
        var A_Pic02_URL:String
        var A_Interpretation:String
        var A_Feature:String
}


}

