

import UIKit
import SnapKit

class TodayViewCell: UICollectionViewCell{
    
    let titleLabel = UILabel()
    let goalLabel = UILabel()
    //let doIt = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: TodayData){
        titleLabel.text = data.routineTitle
        goalLabel.text = data.routineGoal
        //TODO Bool 값 설정
    }
    
    private func attribute(){
        
        backgroundColor = .white
        titleLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
        goalLabel.font = .systemFont(ofSize: 14.0)
        
    }
    
    private func layout(){
        [titleLabel, goalLabel].forEach{
            contentView.addSubview($0)
        }
        titleLabel.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            
        }
        goalLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
