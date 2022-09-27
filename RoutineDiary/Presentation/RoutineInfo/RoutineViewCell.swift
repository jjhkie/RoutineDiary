
import Foundation
import UIKit
import SnapKit

class RoutineViewCell: UICollectionViewCell{
    
    let titleLabel = UILabel()
    //TODO background 에 사용할 image 추가
    //let backgroundImg = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: Category){
        titleLabel.text = data.name
    }
    
    private func attribute(){
        backgroundColor = .white
        titleLabel.font = .systemFont(ofSize: 16.0, weight: .bold)
        //backgroundImg.contentMode = .scaleToFill
    }
    
    private func layout(){
        [titleLabel].forEach{
            contentView.addSubview($0)
        }
        
//        backgroundImg.snp.makeConstraints{
//            $0.edges.equalToSuperview()
//        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
        }
        
    }
    
}
