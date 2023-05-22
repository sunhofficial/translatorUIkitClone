//
//  BookMarkTextStackView.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import SnapKit
import UIKit
final class BookmarkTextStackView : UIStackView {
    private let type : Type
    private let langague : Langague
    private let text : String
    private lazy var languageLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.textColor = type.color
        label.text = langague.title
        return label
    }()
    private lazy var textlabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0 ,weight:  .bold)
        label.textColor = type.color
        label.text = text
        label.numberOfLines = 0
        return label
    }()
    init(langague: Langague, text : String, type : Type){
        self.langague = langague
        self.text = text
        self.type = type
        
        super.init(frame:  .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup(){
        axis = .vertical
        distribution = .equalSpacing
        spacing = 4.0
        [languageLabel, textlabel].forEach{self.addArrangedSubview($0)}
    }
}
