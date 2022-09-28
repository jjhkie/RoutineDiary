

import RxCocoa
import RxSwift
import RealmSwift

struct RoutineMyPageViewModel{
    let disposeBag = DisposeBag()
    let realm = try! Realm()
    
    let myRoutine: Driver<Results<RoutineData>>
    
    init(){
        
//        let myRoutines = [
//            RoutineData(routinetitle: "헬스 주 3회", routineGoal: "다이어트할거야!!", routineCategory: "운동"),
//            RoutineData(routinetitle: "헬스 주 3회", routineGoal: "다이어트할거야!!", routineCategory: "운동"),
//            RoutineData(routinetitle: "헬스 주 3회", routineGoal: "다이어트할거야!!", routineCategory: "운동"),
//            RoutineData(routinetitle: "헬스 주 3회", routineGoal: "다이어트할거야!!", routineCategory: "운동"),
//            RoutineData(routinetitle: "헬스 주 3회", routineGoal: "다이어트할거야!!", routineCategory: "운동"),
//        ]
        
        let abc = realm.objects(RoutineData.self)

        self.myRoutine = Driver.just(abc)
        
//        try! realm.write{
//            realm.add(myRoutines)
//        }
        
    }
}
