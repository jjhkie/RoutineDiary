

import UIKit
import RxSwift
import SnapKit
import RxCocoa

class DayViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let dayTV = UITableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind(DayViewModel())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ VM: DayViewModel){
        VM.dayCellData
            .drive(dayTV.rx.items){tv, row, data in
                let cell = tv.dequeueReusableCell(withIdentifier: "DayViewCell", for: IndexPath(row: row, section: 0)) as! DayViewCell
                
                return cell
            }
    }
    
    
    private func attribute(){
        title = "Day"
        
        dayTV.backgroundColor = .white
        dayTV.register(DayViewCell.self, forCellReuseIdentifier: "DayViewCell")
        
    }
    
    private func layout(){
        view.addSubview(dayTV)
        
        dayTV.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
}
