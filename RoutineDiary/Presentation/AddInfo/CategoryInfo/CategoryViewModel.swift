

import RxSwift
import RxCocoa


struct CategoryViewModel {
    let disposeBag = DisposeBag()
    
    ///View에 전달할 값
    /// 선택한 카테고리 데이터를 view에 전달해주기 위한 값
    let cellData: Driver<[Category]>
    let pop: Signal<Void>
    
    ///어떤 아이템이 선택되었는지 확인하는 값
    let itemSelected = PublishRelay<Int>()
    
    // 다른 controller로 보낼 값
    let selectedCategory = PublishSubject<Category>()
    
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
        
        self.cellData = Driver.just(cateogries)
        
        self.itemSelected
            .map{cateogries[$0]}
            .bind(to: selectedCategory)
            .disposed(by: disposeBag)
        
        self.pop = itemSelected
            .map { _ in Void()}
            .asSignal(onErrorSignalWith: .empty())
    }
}
