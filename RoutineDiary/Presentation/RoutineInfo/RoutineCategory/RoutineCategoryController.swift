

import Foundation
import UIKit
import RxSwift

class RoutineCategoryController: UIViewController{
    
    
    let disposeBag = DisposeBag()
    //let tableView = UITableView()
    
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

//        guard let jsonData = ServiceManager.reloadData(),
//              let dicData = try? JSONDecoder().decode(RoutineCategory.self, from: jsonData) else { return }
        
    }
    
    private func attribute(){
        view.backgroundColor = .systemBlue
        
    }
    
    private func layout(){
        
    }
}
