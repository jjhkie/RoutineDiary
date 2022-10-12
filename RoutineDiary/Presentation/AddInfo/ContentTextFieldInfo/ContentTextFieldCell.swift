

import UIKit
import RxSwift
import RxCocoa


class ContentTextFieldCell: UITableViewCell{
    let disposeBag = DisposeBag()
    
    let contentInputView = UITextView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func bind(){
//        contentInputView.rx.text
//            .orEmpty
//            .bind(to: VM.contentValue)
//            .disposed(by: disposeBag)
//
        contentInputView.rx.didBeginEditing
            .subscribe(onNext: {[self] in
                if(contentInputView.text == "내용을 입력해주세요"){
                    contentInputView.text = nil
                    contentInputView.textColor = .black
                }
            })
            .disposed(by: disposeBag)
        
        contentInputView.rx.didEndEditing
            .subscribe(onNext: {[self] in
                if(contentInputView.text == nil || contentInputView.text == ""){
                    contentInputView.text = "내용을 입력해주세요"
                    contentInputView.textColor = .lightGray
                }
            })
            .disposed(by: disposeBag)
    }
    
    
    private func attribute(){
        contentInputView.font = .systemFont(ofSize: 17)
        contentInputView.textColor = .lightGray
    }
    
    private func layout(){
        contentView.addSubview(contentInputView)
        
        contentInputView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(300)
        }
    }
}
