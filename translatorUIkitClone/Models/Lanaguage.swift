//
//  Lanaguage.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import Foundation
enum Langague : String, CaseIterable , Codable{
    case ko
    case en
    case ja
    case ch
    var title: String {
        switch self{
        case .ko: return NSLocalizedString("Korean", comment: "한국어")
        case .en: return NSLocalizedString("English", comment: "영어")
        case .ja: return NSLocalizedString("Japanese", comment: "일본어")
        case .ch : return NSLocalizedString("Chinese", comment: "중국어")
        }
    }
    var lanagueCode : String {
        self.rawValue
    }
}
