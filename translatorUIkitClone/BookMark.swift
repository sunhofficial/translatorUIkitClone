//
//  BookMark.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import Foundation
struct BookMark : Codable{
    let sourceLangague : Langague
    let translatedLangague : Langague
    let sourceText : String
    let translatedText : String
}
