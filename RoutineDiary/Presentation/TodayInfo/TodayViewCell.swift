

import UIKit
import SnapKit

class TodayViewCell: UICollectionViewCell{
    
    let titleLabel = UILabel()
    let goalLabel = UILabel()
    //let doIt = UIImage()
    
    
    func setData(_ data: TodayCellData){
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
    }
}
