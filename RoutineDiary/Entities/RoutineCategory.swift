
import Foundation

struct RoutineCategory: Codable{
    
    var name: String
    let title: String
    
}

extension RoutineCategory {


    func setName(_ name: String) -> RoutineCategory {

        var newInfo = self

        newInfo.name = name
        return newInfo
    }
}



