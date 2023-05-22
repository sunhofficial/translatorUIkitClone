//
//  TranslateRequestModel.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import Foundation
struct TranslateRequestModel: Codable {
    let source : String
    let target : String
    let text : String
}
