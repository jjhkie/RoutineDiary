


import RxCocoa
import RxSwift
import RealmSwift


struct TodayViewModel{
    
    let disposeBag = DisposeBag()
    let realm = try! Realm()
    
    let TodayCellData: Driver<[TodayData]>
   
    
    
    
    init(){

        let TodayList = [
            TodayData(routineTitle: "aaa", routineGoal: "aa", doIt: true),
            TodayData(routineTitle: "bbb", routineGoal: "bb", doIt: true),
        ]
       
        
        
        self.TodayCellData = Driver.just(TodayList)
        
//        try! realm.write{
//            realm.add(today)
//        }
        
//        let abc = realm.objects(RoutineData.self)
       
        //self.CellData = Driver.just(abc)
        
//        try! realm.write{
//            realm.delete(abc)
//        }
//
        
        
       
        
    }
    
}
