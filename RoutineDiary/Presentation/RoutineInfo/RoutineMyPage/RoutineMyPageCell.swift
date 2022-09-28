
import UIKit
import SnapKit
import RxSwift

class RoutineMyPageCell: UICollectionViewCell{
    
    let disposeBag = DisposeBag()
    
    var categoryLabel = UILabel()
    var titleLabel = UILabel()
    var contentLabel = UILabel()
    var clickCountLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: RoutineData){
        categoryLabel.text = data.routineCategory
        titleLabel.text = data.routinetitle
        contentLabel.text = data.routineGoal
        clickCountLabel.text = String(data.clickCount)
    }
    
    
    
    private func attribute(){
        
        categoryLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        contentLabel.font = .systemFont(ofSize: 14)
    }
    
    private func layout(){
        [categoryLabel,titleLabel,contentLabel,clickCountLabel].forEach{
            contentView.addSubview($0)
        }
        
        categoryLabel.snp.makeConstraints{
            $0.leading.top.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(categoryLabel.snp.bottom)
            $0.leading.equalTo(categoryLabel.snp.leading)
        }
        
        contentLabel.snp.makeConstraints{
            $0.leading.equalTo(categoryLabel.snp.leading)
            $0.bottom.equalToSuperview()
        }
        clickCountLabel.snp.makeConstraints{
            $0.bottom.trailing.equalToSuperview().inset(20)
        }
        
    }
    
}
