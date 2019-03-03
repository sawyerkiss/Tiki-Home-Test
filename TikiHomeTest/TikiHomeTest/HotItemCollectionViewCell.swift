//
//  HotItemViewCellCollectionViewCell.swift
//  TikiHomeTest
//
//  Created by TamTran on 3/3/19.
//  Copyright © 2019 TamTran. All rights reserved.
//

import UIKit

class HotItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    
    @IBOutlet weak var lblKeyword: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    
    public static let sizingCell = UINib(nibName: Constants.cellReuseIdentifier , bundle: nil).instantiate(withOwner: nil, options: nil).first! as! HotItemCollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
    }
    
    public func configure(with data: HotItemModel , indexColor:Int) {
       
        self.lblKeyword.text = data.keyword
        
        self.bgView.layer.cornerRadius = 5
        self.bgView.backgroundColor = UIColor.init(hexFromString:Constants.backgroundColors[indexColor] as! String)
    }

}
