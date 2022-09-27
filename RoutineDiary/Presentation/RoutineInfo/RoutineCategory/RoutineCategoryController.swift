

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RoutineCategoryController: UIViewController{
    
    
    let disposeBag = DisposeBag()
    let tableView = UITableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind(RoutineCategoryViewModel())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        

    }
    
    func bind(_ VM:RoutineCategoryViewModel){
        
        VM.cellData
            .drive(tableView.rx.items){ tv, row, data in
                let cell = tv.dequeueReusableCell(withIdentifier: "RoutineCategoryCell", for: IndexPath(row: row, section: 0)) as! RoutineCategoryCell
                
                cell.titleTextLabel.text = data.title
                cell.nameTextLabel.text = data.name
                
                return cell
            }

//        guard let jsonData = ServiceManager.reloadData(),
//              let dicData = try? JSONDecoder().decode(RoutineCategory.self, from: jsonData) else { return }
        
    }
    
    private func attribute(){
        title = "받아온 name값"
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        
        tableView.register(RoutineCategoryCell.self, forCellReuseIdentifier: "RoutineCategoryCell")
        
    }
    
    private func layout(){
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
}
