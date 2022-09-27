

import UIKit
import SnapKit
import RxSwift

class RoutineCategoryCell: UITableViewCell{
    
    let disposeBag = DisposeBag()
    
    var titleTextLabel = UILabel()
    var nameTextLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attribute(){
        titleTextLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameTextLabel.font = .systemFont(ofSize: 16)
    }
    func layout(){
        [titleTextLabel,nameTextLabel].forEach{
            contentView.addSubview($0)}
        
        titleTextLabel.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
        }
        nameTextLabel.snp.makeConstraints{
            $0.top.equalTo(titleTextLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
    }
    
}
