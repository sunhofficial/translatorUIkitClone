//
//  Type.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import UIKit
enum `Type` {
    case source
    case target
    var color : UIColor {
        switch self{
        case .source : return .label
        case .target : return .mainTintColor
        }
    }
}
