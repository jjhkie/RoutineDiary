


import RxCocoa
import RxSwift


struct TodayViewModel{
    
    let disposeBag = DisposeBag()
    

    let TodayCellData: Driver<[TodayData]>
    
    let addPageButtonTapped = PublishRelay<Void>()
    
    init(){

        let TodayList = [
            TodayData(routineTitle: "aaa", routineGoal: "aa", doIt: true),
            TodayData(routineTitle: "bbb", routineGoal: "bb", doIt: true),
        ]
        
        self.TodayCellData = Driver.just(TodayList)
        

        
        
    }
    
}
