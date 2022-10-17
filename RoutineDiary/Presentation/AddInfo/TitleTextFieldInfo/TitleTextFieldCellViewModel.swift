
import RxCocoa
import RxSwift

class TitleTextFieldCellViewModel:VM{

    struct Input{
        let titleTextValue : Observable<String>
    }
    struct Output{
        
    }
    
    var disposeBag = DisposeBag()
    
    var _titleTextValue: BehaviorRelay<String>
    

    init(){
        _titleTextValue = BehaviorRelay(value: "글 제목")

        
    }
    


    func transform(input: Input) -> Output {

        input.titleTextValue
            .bind(to: self._titleTextValue)
            .disposed(by: disposeBag)
        
        
        
//
//        input.titleTextValue
//            .subscribe(onNext:{ data in
//                self._titleTextValue.accept(data)
//            })
//            .disposed(by: disposeBag)
//
        
        return Output()
    }
}
