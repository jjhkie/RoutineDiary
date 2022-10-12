import Foundation
import RxSwift
import RxCocoa
import RealmSwift

protocol VM {
    
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag{ get set }
    
    func transform(input: Input) -> Output
}

class AddViewModel: VM{
    
    
    struct Input{
        let tableItemClick: Observable<IndexPath>
        let uploadTapped: Observable<Void>
    }
    struct Output{
        let cellData: Driver<[String]>
        let push: Driver<CategoryViewModel>
        let addPop: Signal<Void>
    }
    
    var disposeBag = DisposeBag()

    
    private let _inputContentText = PublishRelay<String?>()
    
    init(model:AddModel = AddModel()){
      
        
    }
   
 

    
//    var routinInfo:Observable<RoutineCategory>{
//        return Observable.combineLatest(_inputTitleText, _inputContentText){
//            title, content in
//
//            return RoutineCategory(title: title, content: content, category: "운동")
//        }
//    }
    
    func transform(input: Input) -> Output {
//        func setTitle(_ title: String?) {
//            self._inputTitleText.accept(title)
//        }
        
        let titleVM = TitleTextFieldCellViewModel()
        let categoryVM = CategoryViewModel()
        let contentVM = ContentTextFieldViewModel()
        
        let title = titleVM
            ._titleTextValue
            .startWith("글 제목")
        
        title
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        let category = categoryVM
            .selectedCategory
            .map{ $0.name}
            .map(addTestFunc)
            .startWith("카테고리 선택")
        
//        let content = Observable.just("내용을 입력해주세요")
//            .map(addTestFunc)
        
        let content = contentVM
            .contentValue
            //.map(addTestFunc)
            .startWith("입력해주세요")
        
        let cellData = Observable
            .combineLatest(title,
                           category,
                           content){ [$0, $1, $2] }
        

        //
        let push = input.tableItemClick
            .map{$0.row}
            .compactMap{row -> CategoryViewModel? in
                guard case 1 = row else { return nil}
                return categoryVM
            }


        let addPop = input.uploadTapped
            .map{_ in
                
                Void()}
            .asSignal(onErrorSignalWith: .empty())
        
        
        //이거 값이 출력한다???
        Observable.combineLatest(title, category, content)
            .map(modelDataAdd)
            .subscribe(onNext: {data in
                print("\(data.category)")
            })
            .disposed(by: disposeBag)

            
        
        
        return Output(cellData: cellData.asDriver(onErrorJustReturn: []),
                      push: push.asDriver(onErrorDriveWith: .empty()),
                      addPop: addPop.asSignal(onErrorSignalWith: .empty()))
    }
    
}

func addTestFunc(data: String) -> String{
    
    return data
}
func modelDataAdd(title: String, category: String, content: String) -> RoutineCategory{
    
    return RoutineCategory(title: title, content: content, category: category)
}

private func validation(name: String?, email: String?) -> Bool {
    return name?.isEmpty == false && email?.isEmpty == false
}

private func testFunc(title: String?) -> Void{
    print("\(title ?? "aaa ")")
}


//
//class AddViewModelTest{
//
//
//
//    //VM -> V
//    //let presentAlert: Signal<Alert>
//
//
//    let titleTextValue = PublishRelay<String>()
//    let contentValue = PublishRelay<String?>()


//    private let _setName = PublishRelay<String?>()
//
////        func setName(_ name: String?) {
////            self._setName.accept(name)
////        }
//
//    //private let _form: BehaviorRelay<TodayModel>
//    private let _form = BehaviorRelay<RoutineCategory>(value: RoutineCategory(name: "", title: ""))    //init에서 초기화
//
//        self._setName
//            .withLatestFrom(self._form, resultSelector: { $1.setName($0!) })
//            .bind(to: self._form)
//            .disposed(by: self.disposeBag)
//
////
////
//        self.push = itemSelected
//            .compactMap{ row -> CategoryViewModel? in
//                guard case 1 = row else {
//                    return nil
//                }
//                return categoryVM
//            }
//            .asDriver(onErrorDriveWith: .empty())
//
//        self.addPop = addButtonTapped
//            .map{ _ in
//                Void()
//
//            }
//            .asSignal(onErrorSignalWith: .empty())
//
////        self.presentAlert = addButtonTapped
////            .withLatestFrom(errorMessage)
////            .map()
////            .asSignal(onErrorSignalWith: .empty())
//    }
//}
//

