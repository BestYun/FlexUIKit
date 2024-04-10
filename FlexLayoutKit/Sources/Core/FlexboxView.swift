//
//  Flexbox.swift
//  FlexLayoutKit
//
//  Created by yun on 2024/3/31.
//

import Foundation

public protocol FlexboxView {
    var flexBaseView: UIView {
        get
    }
}

public extension FlexboxView where Self: UIView{
    var flexBaseView: UIView {
        self
    }
}


extension UIView: FlexboxView {}
