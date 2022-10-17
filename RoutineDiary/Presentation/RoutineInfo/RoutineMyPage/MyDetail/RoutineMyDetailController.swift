

import UIKit
import SnapKit
import RxSwift

final class RoutineMyDetailController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let mainImageView = UIImageView()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let contentLabel = UILabel()
    
    let countLabel = UILabel()
    let percentLabel = UILabel()
    
    
    let goalLabel = UILabel()
    
    let line = UIView()
    
    let countStackView = UIStackView()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    
    func bind(_ VM:RoutineMyViewModel){
        VM.viewData
            .drive{ data in
                self.titleLabel.text = "[\(data.category)]  \(data.title)"
                self.contentLabel.text = " | 내용 : \(data.content)"
                self.countLabel.text = "\(data.count) 번"
                self.percentLabel.text = "\(data.percent) %"
                self.goalLabel.text = data.goalContent
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute(){
        view.backgroundColor = .white
        mainImageView.backgroundColor = .lightGray
        //title
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .label
        //date
        dateLabel.font = .systemFont(ofSize: 14)
        
        //content
        contentLabel.font = .systemFont(ofSize: 14)
        contentLabel.numberOfLines = 0
       
        //Count StackView
        countStackView.axis = .horizontal
        countStackView.distribution = .fillEqually
        
        //count
        countLabel.font = .systemFont(ofSize: 14)
        //percent
        percentLabel.font = .systemFont(ofSize: 14)
        
        line.backgroundColor = .lightGray
        
        goalLabel.numberOfLines = 0
        
        //remove
        //titleLabel.text = "[운동] 헬스장가기 (주 3회)"
        dateLabel.text = " | 시작한 날짜 : 2022.10.13"

  
    }
    
    
    private func layout(){
        
        //stackview
        [countLabel,percentLabel].forEach{
            countStackView.addArrangedSubview($0)
        }
        
        
        //view
        [mainImageView,titleLabel,dateLabel,contentLabel,countStackView,line,goalLabel].forEach{
            view.addSubview($0)
        }
        
        
        mainImageView.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24.0)
            $0.top.equalTo(mainImageView.snp.bottom).offset(36.0)
        }
        
        dateLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(12.0)
        }
        
        contentLabel.snp.makeConstraints{
            $0.leading.equalTo(dateLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.top.equalTo(dateLabel.snp.bottom).offset(12.0)
        }
        
        countStackView.snp.makeConstraints{
            $0.leading.equalTo(contentLabel.snp.leading)
            $0.trailing.equalTo(contentLabel.snp.trailing)
            $0.top.equalTo(contentLabel.snp.bottom).offset(50.0)
        }
        
        line.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(countStackView.snp.bottom).offset(35.0)
            $0.height.equalTo(5.0)
        }
        
        goalLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(24.0)
            $0.top.equalTo(line.snp.bottom).offset(30.0)
        }
        
    }
}
