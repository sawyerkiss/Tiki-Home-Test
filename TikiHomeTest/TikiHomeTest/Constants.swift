//
//  Constants.swift
//  TikiHomeTest
//
//  Created by TamTran on 3/3/19.
//  Copyright © 2019 TamTran. All rights reserved.
//

import UIKit

public class Constants: NSObject {

    static let cellReuseIdentifier : String = "HotItemCollectionViewCell"
    
    static let itemMinWidth : CGFloat = 112
    
    static let itemMaxHeight : CGFloat = 180
    
    static let backgroundColors : NSArray = ["#16702e", "#005a51", "#996c00", "#5c0a6b", "#006d90", "#974e06", "#99272e", "#89221f", "#00345d"] 
    
    static let urlToFetchData = "https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json"
    
    static let itemKeywordPadding = 8
    
}
