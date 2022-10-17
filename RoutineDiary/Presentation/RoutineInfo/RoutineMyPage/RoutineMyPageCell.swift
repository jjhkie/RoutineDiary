
import UIKit
import SnapKit
import RxSwift

final class RoutineMyPageCell: UICollectionViewCell{
    
    let disposeBag = DisposeBag()
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let todayButton = UIButton()//클릭 시 오늘 루틴에 추가
    let countLabel = UILabel()// 지금까지 추가한 횟수
    let percentLabel = UILabel()// 완료한 확률
    
    //stackView
    let subStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ data: MyRoutine){
        //categoryLabel.text = data.routineCategory
        titleLabel.text = data.title
        contentLabel.text = data.content
        countLabel.text = String(data.count)
        percentLabel.text = String(data.percent) + "%"
        //clickCountLabel.text = String(data.clickCount)
    }
    
    
    
    private func attribute(){

        //ImageView
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 21.0
        
        //Title
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .label
        
        //Content
        contentLabel.font = .systemFont(ofSize: 14)
        contentLabel.textColor = .secondaryLabel
        contentLabel.numberOfLines = 0
        
        //Today Button
        todayButton.setImage(UIImage(systemName: "heart"),for: .normal)
        todayButton.tintColor = .secondaryLabel
        
        //Count Label
        countLabel.font = .systemFont(ofSize: 10, weight: .bold)
        countLabel.text = "0"
        
        //Percent Label
        percentLabel.font = .systemFont(ofSize: 10, weight: .bold)
        percentLabel.text = "0%"
        
        //StackView
        subStackView.axis = .horizontal
        subStackView.distribution = .fillEqually
    }
    
    private func layout(){
        
        //StackView layout
        [todayButton,countLabel,percentLabel].forEach{
            subStackView.addArrangedSubview($0)
        }
        
        [imageView,titleLabel,contentLabel,subStackView].forEach{
            self.addSubview($0)
        }
        
        
        imageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(16.0)
            $0.width.height.equalTo(45.0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(16.0)
            $0.top.equalTo(imageView.snp.top)
        }
        
        contentLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        subStackView.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(contentLabel.snp.trailing)
            $0.top.equalTo(contentLabel.snp.bottom).offset(10.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }

        
    }
    
}
