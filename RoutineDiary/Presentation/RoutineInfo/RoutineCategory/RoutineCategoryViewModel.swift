

import Foundation
import RxCocoa
import RxSwift


class RoutineCategoryViewModel{
    
    let disposeBag = DisposeBag()
    
    //셀에 뿌릴 값
    let cellData: Driver<[RoutineCategory]>
    
    //받아온 값
    let jsonData = PublishSubject<[RoutineCategory]>()
    
    init(){
        
        let routineCategories = [
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동")
     
        ]
        
        self.cellData = Driver.just(routineCategories)
    }
    

//    func reloadData(){
//        _ = ServiceManager.fetchData()
//            .subscribe{event in
//                switch event{
//                case .next(let data):
//                    break
//                case .error(let err):
//                    break
//                case .completed:
//                    break
//                }
//
//            }
//    }
    
}
