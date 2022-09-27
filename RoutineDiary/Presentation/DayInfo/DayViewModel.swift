

import Foundation
import RxSwift
import RxCocoa

struct DayViewModel{
    
    let disposeBag = DisposeBag()
    
    let dayCellData: Driver<[RoutineCategory]>
    
    init(){
        let dayDatas = [
            RoutineCategory(name: "name", title: "여기에 제목을 작성"),
            RoutineCategory(name: "name", title: "여기에 제목을 작성"),
            RoutineCategory(name: "name", title: "여기에 제목을 작성"),
            RoutineCategory(name: "name", title: "여기에 제목을 작성"),
            RoutineCategory(name: "name", title: "여기에 제목을 작성"),
            RoutineCategory(name: "name", title: "여기에 제목을 작성")
        ]
        
        self.dayCellData = Driver.just(dayDatas)
    }
    
}
