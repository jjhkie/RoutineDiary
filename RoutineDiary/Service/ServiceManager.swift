

import Foundation
import RxSwift

class ServiceManager{
    
    
    ///RoutineView Category Json 정보 가져오기
    static func fetchData() -> Observable<RoutineCategory>{
        return Observable.create {obser in
            let fileName: String = "Category"
            let Type = "json"
            
            guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: Type) else { return }
            
            do{
                let data = try Data(contentsOf: fileLocation)
//                let data = try Data(contentsOf: URL(fileURLWithPath: fileLocation),options: .mappedIfSafe)
                
                let routineCa = try JSONDecoder().decode([RoutineCategory].self, from: data)
                obser.onNext(routineCa)
                obser.onCompleted()
                return Disposables.create()
            }catch{
                return Disposables.create()
            }
        }
    }
}
