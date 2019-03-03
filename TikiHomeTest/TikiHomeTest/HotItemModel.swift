//
//  HotItemModel.swift
//  TikiHomeTest
//
//  Created by TamTran on 3/3/19.
//  Copyright © 2019 TamTran. All rights reserved.
//

import UIKit

import SwiftyJSON

class HotItemModel: NSObject {

    var keyword: String = ""
    
    var icon : String = ""
    
    
    init(keyword key:String , icon:String){
        
        self.keyword = key
        self.icon = icon
    }
    
    init(fromJSONModel model:JSON) {
        
        self.keyword = model["keyword"].string ?? ""
        self.icon = model["icon"].string ?? ""
        
        
    }
}
