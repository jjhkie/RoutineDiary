
import Foundation

struct RoutineCategory: Codable{
    
    var title: String
    var content: String
    var category: String
    
    init(title: String, content: String, category: String) {
        self.title = title
        self.content = content
        self.category = category
    }
    
}

extension RoutineCategory {


    func setTitle(_ title: String) -> RoutineCategory{
        
        var newInfo = self
        print(title)
        newInfo.title = title
        return newInfo
    }
    
    func setContent(_ content: String) -> RoutineCategory {

        var newInfo = self
        
        newInfo.content = content
        return newInfo
    }
}



