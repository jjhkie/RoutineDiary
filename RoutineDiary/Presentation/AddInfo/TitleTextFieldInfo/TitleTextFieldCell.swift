

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class TitleTextFieldCell: UITableViewCell{
    
    let disposeBag = DisposeBag()
    
    let titleInputField = UITextField()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        bind(TitleTextFieldCellViewModel())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ VM: TitleTextFieldCellViewModel){
        let input = TitleTextFieldCellViewModel.Input(titleTextValue: self.titleInputField.rx.text.orEmpty.asObservable())
        
        let output = VM.transform(input: input)
        
//        titleInputField.rx.text.orEmpty
//            .debug()
//            .bind(to: VM._titleTextValue)
//            .disposed(by: disposeBag)

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
