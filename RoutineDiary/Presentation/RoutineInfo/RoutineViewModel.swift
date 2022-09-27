

import Foundation
import RxSwift
import RxCocoa


struct RoutineViewModel {
    
    let disposeBag = DisposeBag()
    
    let RoutineCellData: Driver<[Category]>
    
    
    init(){
        let cateogries = [
            Category(id: 1, name: "운동"),
            Category(id: 2, name: "생활습관"),
            Category(id: 3, name: "휴식"),
            Category(id: 4, name: "독서"),
            Category(id: 5, name: "취미생활"),
            Category(id: 6, name: "자산관리"),
            Category(id: 7, name: "개인 시간"),
            Category(id: 8, name: "업무")
        ]
        
        self.RoutineCellData = Driver.just(cateogries)
    }
    
    
    func time(){
        //let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        dateFormatter.dateFormat = "YYYY년 MM월 dd일"
        //참고 https://leeari95.tistory.com/30
    }
}
