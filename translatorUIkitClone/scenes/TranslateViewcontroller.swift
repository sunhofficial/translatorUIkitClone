//
//  TranslateViewcontroller.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/20.
//

import UIKit
import SnapKit
final class TranslateViewController: UIViewController{
    private lazy var currentLangagueBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("한국어", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        btn.setTitleColor(.label, for: .normal)
        btn.layer.cornerRadius = 9.0
        btn.backgroundColor = .systemBackground
        return btn
    }()
    private lazy var targetLangagueBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("영어", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        btn.setTitleColor(.label, for: .normal)
        btn.layer.cornerRadius = 9.0
        btn.backgroundColor = .systemBackground
        return btn
    }()
    private lazy var buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        [currentLangagueBtn, targetLangagueBtn].forEach{
            stackView.addArrangedSubview($0)
        }
        return stackView
    }()
    private lazy var resultBaseView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
       return view
    }()
    private lazy var resultLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23.0, weight: .bold)
        label.text =  "hello"
        label.numberOfLines = 0
        return label
    }()
    private lazy var bookMarkBtn : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        return button
    }()
    private lazy var copyMarkBtn : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        return button
    }()
    private lazy var sourceLabelBaseButton: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSourcelabelbase))
        view.addGestureRecognizer(gesture)
        return view
    }()
 
    private lazy var sourceLabel : UILabel = {
        let label = UILabel()
        label.text = "텍스트 입력"
        label.textColor = .tertiaryLabel
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 23.0, weight: .semibold)
        return label    
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        setupViews()
    }

}
extension TranslateViewController : SourcetextvcDelegate {
    func didEnter(_ sourcetext: String) {
        if(sourcetext.isEmpty){return}
        sourceLabel.text = sourcetext
        sourceLabel.textColor = .label
    }
}
private extension TranslateViewController {

    func setupViews(){
        [buttonStackView, resultBaseView, resultLabel, bookMarkBtn, copyMarkBtn, sourceLabelBaseButton, sourceLabel].forEach{
            view.addSubview($0)
        }
        let defaultspacing : CGFloat = 16.0
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(defaultspacing)
            $0.height.equalTo(50.0)
        }
        resultBaseView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(buttonStackView.snp.bottom).offset(defaultspacing)
            $0.bottom.equalTo(bookMarkBtn.snp.bottom).offset(defaultspacing) // TODO : 컨텐트 사이즈에 맞게 높이가 가변할수 있도록 수정하기
        }
        resultLabel.snp.makeConstraints{
            $0.leading.equalTo(resultBaseView.snp.leading).inset(24.0)
            $0.trailing.equalTo(resultBaseView.snp.trailing).inset(24.0)
            $0.top.equalTo(resultBaseView.snp.top).inset(24.0)
        }
        bookMarkBtn.snp.makeConstraints{
            $0.leading.equalTo(resultLabel.snp.leading)
            $0.top.equalTo(resultLabel.snp.bottom).offset(24.0)
            $0.height.width.equalTo(40.0)
        }
        copyMarkBtn.snp.makeConstraints{
            $0.leading.equalTo(bookMarkBtn.snp.trailing).inset(8.0)
            $0.top.equalTo(bookMarkBtn.snp.top)
            $0.width.height.equalTo(bookMarkBtn)
        }
        sourceLabelBaseButton.snp.makeConstraints{
            $0.trailing.leading.equalTo(resultBaseView)
            $0.top.equalTo(resultBaseView.snp.bottom).offset(defaultspacing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide )
        }
        sourceLabel.snp.makeConstraints{
            $0.leading.equalTo(sourceLabelBaseButton.snp.leading).inset(24.0)
            $0.trailing.equalTo(sourceLabelBaseButton.snp.trailing).inset(24.0)
            $0.top.equalTo(sourceLabelBaseButton.snp.top).inset(24.0)

        }
    }
    @objc func didTapSourcelabelbase(){
        let vc = SourceTextViewController(delegate: self)
        present(vc,animated: true)
    } 
}
