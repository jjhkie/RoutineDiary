


import RxCocoa
import RxSwift



class TodayViewModel: VM{

    
    struct Input {
        
    }
    
    struct Output {
        let TodayCellData: Driver<[TodayData]>
    }
    
    var disposeBag = DisposeBag()
   
    let TodayList: [TodayData]
   
    init(){

        self.TodayList = [
            TodayData(routineTitle: "aaa", routineGoal: "aa", doIt: true),
            TodayData(routineTitle: "bbb", routineGoal: "bb", doIt: true),
        ]  
        
    }
    
    func transform(input: Input) -> Output {
        let TodayCellData = Driver.just(TodayList)
        
        return Output(TodayCellData: TodayCellData.asDriver())
    }
    
}
