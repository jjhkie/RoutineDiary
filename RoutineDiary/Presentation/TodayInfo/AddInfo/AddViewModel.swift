

import Foundation
import RxSwift
import RxCocoa


struct AddViewModel{
    let titleTextFieldVM = TitleTextFieldCellViewModel()
    let contentTextFieldVM = ContentTextFieldViewModel()
    
    //VM -> V
    //let presentAlert: Signal<Alert>
    let cellData: Driver<[String]>
    let push: Driver<CategoryViewModel>
    
    let addPop: Signal<Void>
    
    //V -> VM
    let itemSelected = PublishRelay<Int>()
    let addButtonTapped = PublishRelay<Void>()
    
    
    init(){
        let title = Observable.just("글 제목")
        let categoryVM = CategoryViewModel()
        let category = categoryVM
            .selectedCategory
            .map{ $0.name}
            .startWith("카테고리 선택")
        let content = Observable.just("내용을 입력해주세요")
        
        self.cellData = Observable
            .combineLatest(title,
                           category,
                           content){ [$0, $1, $2] }
            .asDriver(onErrorJustReturn: [])
        
        let titleMessage = titleTextFieldVM
            .titleTextValue
            .map{$0?.isEmpty ?? true}
            .startWith(true)
            .map{$0 ? [" 제목을 입력해주세요."] : []}
        
        let categoryMessage = categoryVM
            .selectedCategory
            .map{ _ in false}
            .startWith(true)
            .map{ $0 ? ["카테고리를 선택해주세요"] : []}
        
        let contentMessage =  contentTextFieldVM
            .contentValue
            .map{$0?.isEmpty ?? true}
            .startWith(true)
            .map{ $0 ? ["내용을 입력해주세요"] : []}
            
        let errorMessage = Observable
            .combineLatest(
                titleMessage,
                categoryMessage,
                contentMessage
                ){$0 + $1 + $2}

        self.push = itemSelected
            .compactMap{ row -> CategoryViewModel? in
                guard case 1 = row else {
                    return nil
                }
                return categoryVM
            }
            .asDriver(onErrorDriveWith: .empty())
        
        self.addPop = addButtonTapped
            .map{ _ in Void()}
            .asSignal(onErrorSignalWith: .empty())
   
//        self.presentAlert = addButtonTapped
//            .withLatestFrom(errorMessage)
//            .map()
//            .asSignal(onErrorSignalWith: .empty())
    }
}
