
import RxSwift
import RxCocoa


final class AddDataViewModel{
    var disposeBag = DisposeBag()

    struct Input {
        let titleTextValue : Observable<String>
        let contentTextValue : Observable<String>
        let goalContentTextValue : Observable<String>
        
        let uploadTapped : Observable<Void>
        let closeTapped : Observable<Void>
    }
    
    struct Output {
        let closeDismiss : Signal<Void>
        let uploadDismiss : Signal<Void>
        let isValid : Observable<Bool>
       
    }
    

    let _titleText = BehaviorRelay(value: "" )
    let _contentText : BehaviorRelay<String>
    let _goalText : BehaviorRelay<String>
    let _routineInfo: Observable<MyRoutine>
    
    var _isValid: Observable<Bool>
    
    init(){
        print("init")
        _contentText = BehaviorRelay(value: "")
        _goalText = BehaviorRelay(value: "")
        
        _routineInfo = Observable
            .combineLatest(_titleText, _contentText, _goalText){ title, content, goal in
                
                return MyRoutine.init(title: title, category: "운동", content: content, goalContent: goal, today: false, count: 0, percent: 0.0)
            }
        
        
        _isValid = Observable.combineLatest(self._titleText, self._contentText, self._goalText).map{
            title,content,goal in
            print("데이터 유효성 검사")
            return !title.isEmpty && !content.isEmpty && !goal.isEmpty
        }
        
    }

    
    func transform(input: Input) -> Output {
        print("transform")

        input.titleTextValue
            .bind(onNext: {
                self.setTitle($0)
            })
            .disposed(by: disposeBag)

        input.contentTextValue
            .bind(onNext: {
                self.setContent($0)
            })
            .disposed(by: disposeBag)
        
        input.goalContentTextValue
            .bind(onNext: {
                self.setGoal($0)
            })
            .disposed(by: disposeBag)

        
        self._contentText
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        self._goalText
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        //뒤로가기 버튼
        let closeButtonTapped = input.closeTapped
            .map{_ in
                Void()
            }
        
        let uploadButtonTapped = input.uploadTapped
            .withLatestFrom(_routineInfo)
            .map(setData)
            .map{_ in
                Void()
            }
 
        
        
        return Output(
            
            closeDismiss: closeButtonTapped.asSignal(onErrorSignalWith: .empty()),
            uploadDismiss: uploadButtonTapped.asSignal(onErrorSignalWith: .empty()),
            isValid: _isValid.asObservable()
        )
    }
    
    func setTitle(_ title: String) {
        self._titleText.accept(title)
    }
    func setContent(_ content: String){
        self._contentText.accept(content)
    }
    func setGoal(_ goal: String){
        self._goalText.accept(goal)
    }
    
    func testFunc(text: String)-> String{
        print("data: \(text)")
        return text
    }
        
    //UserDefaultsManager를 사용하여 값 넣기
    func setData(data: MyRoutine) -> Void{
        
        UserDefaultsManager().setRoutine(data)
        print(data.title)
        
    }
}
