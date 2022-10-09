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
    
    func transform(input: Input) -> Output {
        
        
        let title = Observable.just("글 제목")
        let categoryVM = CategoryViewModel()
        
        let category = categoryVM
            .selectedCategory
            .map{ $0.name}
            .startWith("카테고리 선택")
        let content = Observable.just("내용을 입력해주세요")
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
            .map{ _ in
                Void()
            }
            
        return Output(cellData: cellData.asDriver(onErrorJustReturn: []),
                      push: push.asDriver(onErrorDriveWith: .empty()),
                      addPop: addPop.asSignal(onErrorSignalWith: .empty()))
    }
    
}

private func addTestFunc(title: String?, content: String?) -> Void{
    print("\(title ?? "값이 없습니다.") + \(content ?? " 값이 없습니다.")")
}

private func validation(name: String?, email: String?) -> Bool {
    return name?.isEmpty == false && email?.isEmpty == false
}

//
//class AddViewModelTest{
//
//
//
//    //VM -> V
//    //let presentAlert: Signal<Alert>
//
//    //let addPop: Signal<RoutineData>
//    let titleTextValue = PublishRelay<String>()
//    let contentValue = PublishRelay<String?>()
//    //let testPop: Signal<TodayModel>
//
//    //V -> VM
//
//
//    //var todayData : TodayData
//    private let _setName = PublishRelay<String?>()
//        func setName(_ name: String?) {
//            self._setName.accept(name)
//        }
//    //private let _form: BehaviorRelay<TodayModel>
//    private let _form = BehaviorRelay<TodayModel>(value: TodayModel(name: "", title: ""))    //init에서 초기화
//
//    init(){
//
//        self._setName
//            .withLatestFrom(self._form, resultSelector: { $1.setName($0!) })
//            .bind(to: self._form)
//            .disposed(by: self.disposeBag)
//  }
//
//
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

