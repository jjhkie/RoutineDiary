

import Foundation
import RxSwift


struct RoutineViewModel {
    
    let disposeBag = DisposeBag()
    
    
    init(){
        var routines = [
            RoutineData(routineTitle: "aaa", routineGoal: "aa", date: Date(), count: 0),
            RoutineData(routineTitle: "bbb", routineGoal: "bb", date: Date(), count: 0),
            RoutineData(routineTitle: "ccc", routineGoal: "cc", date: Date(), count: 0),
        ]
    }
    
    
    func time(){
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        dateFormatter.dateFormat = "YYYY년 MM월 dd일"
        //참고 https://leeari95.tistory.com/30
    }
}
