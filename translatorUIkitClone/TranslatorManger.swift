//
//  TranslatorManger.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import Foundation
import Alamofire
struct TranslatorManger {
    var sourceLangague : Langague = .ko
    var targetLangague : Langague = .en
    func translate(from text : String, completionHandler : @escaping (String) -> Void){
        guard let url = URL(string: "https://openapi.naver.com/v1/papago/n2mt") else {return}
        let requestModel = TranslateRequestModel(source: sourceLangague.lanagueCode, target: targetLangague.lanagueCode, text: text)
        let headers : HTTPHeaders = [
            "X-Naver-Client-Id": "wfOWHvvtHYvHmlFVhTpp",
            "X-Naver-Client-Secret": "If9CS9ioON"
        ]
        AF.request(url,method: .post,parameters: requestModel, headers: headers)
            .responseDecodable(of : TranslateResponseModel.self){
                res in
                switch res.result{
                case .success(let result):
                    completionHandler(result.translatedText)
                case .failure(let err) : print(err.localizedDescription)
                }
            }.resume()
        
    }
}
