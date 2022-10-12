
import RxCocoa
import RxSwift

class TitleTextFieldCellViewModel:VM{

    
    //let titleTextValue = PublishRelay<String>()
    struct Input{
        //let titleTextValue : Observable<String>
        let titleTextValue : ControlProperty<String>
    }
    struct Output{
        
    }
    
    var disposeBag = DisposeBag()
    
    
    var _titleTextValue = PublishRelay<String>()
    
    init(){
        _titleTextValue
             .subscribe(onNext:{data in
                 print("cccccc")
             })
             .disposed(by: disposeBag)
    }
    
    func transform(input: Input) -> Output {
        input.titleTextValue
            .subscribe(onNext:{_ in
                    print("bbb")
            })
            .disposed(by: disposeBag)
        
       
        
        return Output()
    }
}
