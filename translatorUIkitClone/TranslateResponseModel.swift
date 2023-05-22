//
//  TranslateResponseModel.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import Foundation
struct TranslateResponseModel : Decodable{
    private let message : Message
    var translatedText : String {message.result.translatedText}
    struct Message : Decodable {
        let result : Result
    }
    struct Result : Decodable {
        let translatedText : String
    }
}
