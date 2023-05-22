//
//  UserDefaults+.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import Foundation
extension UserDefaults {
    enum Key : String {
        case bookamrks
    }
    var bookmarks : [BookMark]{
        get {
            guard let data = UserDefaults.standard.data(forKey: Key.bookamrks.rawValue) else {return []}
            return (try? PropertyListDecoder().decode([BookMark].self, from: data)) ?? []
        }
        set{
            UserDefaults.standard.setValue(try? PropertyListEncoder().encode(newValue), forKey: Key.bookamrks.rawValue)
        }
    }
}
