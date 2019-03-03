//
//  ViewController.swift
//  TikiHomeTest
//
//  Created by TamTran on 3/1/19.
//  Copyright © 2019 TamTran. All rights reserved.
//

import UIKit

import SwiftyJSON
import Alamofire

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionHeightConstraint: NSLayoutConstraint!
    
    
    private var data: [HotItemModel] = [HotItemModel](){
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let apiFetcher = APIRequestFetcher()
    
//    static let dataSet = [
//        HotItemModel(keyword:"iphone" , icon : ""),
//         HotItemModel(keyword:"Vé máy bay giá rẻ" , icon : ""),
//           HotItemModel(keyword:"Combo Sách Đừng Để Lỡ Nhau (Tập 1 + 2)" , icon : ""),
//             HotItemModel(keyword:"Top sách ngoại văn giá rẻ, giảm tới 50%" , icon : ""),
//               HotItemModel(keyword:"Thời trang thu đông cho bé, ưu đãi giảm tới 99.9999999999999%, nhập mã GIAMGIA mua ngay" , icon : ""),
//                 HotItemModel(keyword:"Bé vui haloween, nhập mã MAQUAI100000000 giảm tới 10%" , icon : ""),
//                   HotItemModel(keyword:"Macbook Pro 2018" , icon : ""),
//                     HotItemModel(keyword:"Gói TikiNow 1 năm" , icon : "")
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupCollectioView()
        
        fetchData()
    }
    
    private func setupCollectioView() {
        
        let nib = UINib(nibName: Constants.cellReuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
        
        let edgeInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        collectionViewFlowLayout.sectionInset = edgeInsets
        
        collectionHeightConstraint.constant = Constants.itemMaxHeight + edgeInsets.top + edgeInsets.bottom 
    }
    
    // MARK: - UICollectionViewDatasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! HotItemCollectionViewCell
        
        let example = data[indexPath.item]
  
        apiFetcher.fetchImage(url: example.icon, completionHandler: { image, _ in
                cell.imageIcon.image = image
        })
        
        
        cell.configure(with: example , indexColor: indexPath.row % Constants.backgroundColors.count)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let edgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        
        let example = data[indexPath.item]
//        let text = example.keyword
        
//        var width = NSAttributedString.init(string: text).width(withConstrainedHeight:20)
        
            //UILabel.textWidth(font: UIFont.systemFont(ofSize: 14.0, weight: .regular) , text: text )
        

        
//        return CGSize(width: width , height: Constants.itemMaxHeight)
        
        let cell = HotItemCollectionViewCell.sizingCell
        
//         let example = data[indexPath.item]
        
        
        cell.configure(with: example , indexColor: indexPath.row % Constants.backgroundColors.count)
        
        var width = cell.lblKeyword.optimalWidth
        
        if width/2 + CGFloat ( 2 * Constants.itemKeywordPadding ) < Constants.itemMinWidth {
            width = Constants.itemMinWidth
        } else {
            width =  (width * 0.6 ).rounded(.up) + CGFloat ( 2 * Constants.itemKeywordPadding )
        }
        
        return CGSize(width: width , height: Constants.itemMaxHeight)
        
    }
    
    func fetchData() {
       
        apiFetcher.fetchData(url: Constants.urlToFetchData , completionHandler: {
            [weak self] results, error in
            if case .failure = error {
                return
            }
            
            guard let results = results, !results.isEmpty else {
                return
            }
            
            for result in results {
                
                let item = HotItemModel.init(fromJSONModel: result)
                
                self?.data.append(item)
                
            }
        })
    }
    


}

