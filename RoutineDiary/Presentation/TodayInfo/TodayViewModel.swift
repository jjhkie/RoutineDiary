

import Foundation
import RxCocoa


struct TodayViewModel{
    
    let push: Driver<AddViewModel>
    
    let addButtonTapped = PublishRelay<Void>()
    
   
    
}
