//
//  WaterFallViewController.swift
//  FlexLayoutKitExample
//
//  Created by yun on 2024/4/5.
//

import FlexLayoutKit
import UIKit

private let reuseIdentifier = "Cell"

/// 瀑布流
class WaterFallViewController: FlexboxBaseViewController, UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
//    lazy var layout = WaterFallFlowLayout().then { layout in
//        layout.delegate = self
//    }
    lazy var layout = SelfSizingFlowLayout().then { layout in
        layout.delegate = self
    }
                               
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then { collectionView in
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = .zero
        collectionView.register(FCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
                               
    var data = [String]()
                               
    override func viewDidLoad() {
        super.viewDidLoad()
    }
                               
    @FlexboxViewBuilder override func bodyView() -> [FlexboxView] {
        collectionView
            .flex
            .expanded()
    }
                               
    // MARK: UICollectionViewDataSource
                               
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
                               
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
                               
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FCollectionCell
                                   
        cell.text = "index = \(indexPath.row)"
                                           
        return cell
    }
                               
    // MARK: UICollectionViewDelegate
                               
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("did selected item \(indexPath)")
    }
                                   
}

extension WaterFallViewController: WaterFallLayoutDelegate, SelfSizingFlowLayoutDelegate {
    
    //       return CGFloat(arc4random_uniform(150) + 50)

    
    func waterFall(_ collectionView: UICollectionView, layout waterFallLayout: WaterFallFlowLayout, heightForItemAt indexPath: IndexPath) -> CGFloat {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FCollectionCell
//                                   
//        cell.text = "index = \(indexPath.row)"
//        cell.contentView.flex.applyLayout(mode: .adjustHeight, preservingOrigin: true)
//        return cell.contentView.frame.size.height
        return 100
    }
    
    func heightForItem(at indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        return CGFloat(arc4random_uniform(150) + 50)
    }
    
}


private class FCollectionCell: CollectionDynamicCell {
    @UState var text: String?
                               
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .darkGray
    }

    override func bodyView() -> FlexboxView {
        Text($text)
            .fontSize(18)
            .textColor(.orange)
            .backgroundColor(.blue)
            .numberOfLines(0)
    }
                               
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}