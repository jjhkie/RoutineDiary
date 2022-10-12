

import Foundation
import RxSwift
import RxCocoa

struct DayViewModel{
    
    let disposeBag = DisposeBag()
    
    let dayCellData: Driver<[RoutineCategory]>
    
    init(){
        let dayDatas = [
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동"),
            RoutineCategory(title: "여기에 제목을 작성", content: "name", category: "운동")
     
      
        ]
        
        self.dayCellData = Driver.just(dayDatas)
    }
    
}
