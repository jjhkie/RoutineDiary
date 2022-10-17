

import RxCocoa
import RxSwift
import UIKit


final class RoutineMyPageViewModel:VM{

    struct Input{
        let modelSelected: Observable<MyRoutine>
    }
    
    
    struct Output{
        let myRoutineCellData: Driver<[MyRoutine]>
        let detailPush: Driver<RoutineMyViewModel>
    }
    var disposeBag = DisposeBag()
    
    
    
    //초기 데이터
    var myRoutines : [MyRoutine]

  
    init(){
        self.myRoutines = UserDefaultsManager().getRoutine()
//        self.myRoutines = [
//            MyRoutine(title: "title", category: "운동", content: "내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다", goalContent: "목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다", today: false, count: 0, percent: 0.0),
//            MyRoutine(title: "title", category: "운동", content: "내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다", goalContent: "목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다", today: false, count: 0, percent: 0.0),
//            MyRoutine(title: "title", category: "운동", content: "내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다", goalContent: "목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다", today: false, count: 0, percent: 0.0),
//            MyRoutine(title: "title", category: "운동", content: "내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다", goalContent: "목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다목표입니다", today: false, count: 0, percent: 0.0)
//    
//         
//        ]
        
    }

    func transform(input: Input) -> Output {
    
        let cellData = Observable.just(myRoutines)

        let push = input.modelSelected
            .compactMap{data -> RoutineMyViewModel? in
                
                return RoutineMyViewModel(myRoutine: data)
            }
        
        return Output(myRoutineCellData: cellData.asDriver(onErrorJustReturn: []),
                      detailPush: push.asDriver(onErrorDriveWith: .empty())
        )
    }
   
        
//        try! realm.write{
//            realm.add(myRoutines)
//        }
        
//        self.detailPush = submitModelData
//            .map{data in
//                print(data)
//                return RoutineMyViewModel(myRoutine: data)
//            }
//            .asDriver(onErrorDriveWith: .empty())
        
   
    

}
