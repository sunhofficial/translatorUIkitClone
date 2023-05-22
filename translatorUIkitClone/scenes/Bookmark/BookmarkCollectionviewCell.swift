//
//  BookmarkCollectionviewCell.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/22.
//

import SnapKit
import UIKit
final class BookmarkCollectionviewCell: UICollectionViewCell {
    static let identifier = "Bookmarkcell"
    private var sourceBookMarkTextStackView : BookmarkTextStackView!
    private var targetBookMarkTextStackView : BookmarkTextStackView!
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16.0
        stackView.layoutMargins = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        stackView.isLayoutMarginsRelativeArrangement = true
        [sourceBookMarkTextStackView, targetBookMarkTextStackView].forEach{
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    func setup(from bookmark : BookMark){
        backgroundColor = .systemBackground
        layer.cornerRadius = 12.0
        sourceBookMarkTextStackView = BookmarkTextStackView(langague: bookmark.sourceLangague, text: bookmark.sourceText, type: .source)
        targetBookMarkTextStackView = BookmarkTextStackView(langague: bookmark.translatedLangague, text: bookmark.translatedText, type: .target)
        stackView.subviews.forEach{$0.removeFromSuperview()}
        [sourceBookMarkTextStackView, targetBookMarkTextStackView].forEach{stackView.addArrangedSubview($0)}
        addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width - 32.0 )
        }
       
      
    }
}
