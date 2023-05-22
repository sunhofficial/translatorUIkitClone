//
//  SourceTextViewController.swift
//  translatorUIkitClone
//
//  Created by 235 on 2023/05/21.
//

import UIKit
import SnapKit
protocol SourcetextvcDelegate : AnyObject {
    func didEnter(_ sourcetext : String)
}
final class SourceTextViewController : UIViewController {
    private let placeholderText = "텍스트 입력"
    private weak var delegate : SourcetextvcDelegate?
    private lazy var textView : UITextView = {
        let textview = UITextView()
        textview.text = placeholderText
        textview.textColor = .secondaryLabel
        textview.font = .systemFont(ofSize: 18.0, weight: .semibold)
        textview.returnKeyType = .done
        textview.delegate = self
        return textview
    }()
    init(delegate : SourcetextvcDelegate?){
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(textView)
        textView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(16.0)
        }
    }
}
extension SourceTextViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else {return}
        textView.text = nil
        textView.textColor = .label
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard text == "\n" else {return true}
        delegate?.didEnter(textView.text )
        dismiss(animated: true)
        textView.resignFirstResponder()
        return true
    }
}
