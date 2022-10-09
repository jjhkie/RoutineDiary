

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class TitleTextFieldCell: UITableViewCell{
    
    let disposeBag = DisposeBag()
    
    let titleInputField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ VM: TitleTextFieldCellViewModel){
        //var mainVM = AddViewModel()
        
//        titleInputField.rx.text
//            .orEmpty
//            .bind(to: mainVM.titleTextValue)
//            .disposed(by: disposeBag)
//
        
//        titleInputField.rx.text
//                    .orEmpty
//                    .withUnretained(mainVM)// (Object, Element) 듀플 반환
//                    .bind(onNext: { $0.0.setName($0.1) })
//                    .disposed(by: disposeBag)
        
    }
    
    private func attribute(){
        titleInputField.font = .systemFont(ofSize: 17)
    }
    
    private func layout(){
        contentView.addSubview(titleInputField)
        
        titleInputField.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(20)
        }
    }
}
