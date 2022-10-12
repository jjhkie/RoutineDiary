

import Foundation


struct AddModel{
    var data = RoutineCategory(title: "", content: "", category: "")
    
    func setName(content: String) -> RoutineCategory{
        var newInfo = self.data
        
        newInfo.content = content
        
        return newInfo
    }
    
    func setTitle(title: String) -> RoutineCategory{
        var newInfo = self.data
        print("\(title)")
        newInfo.title = title
        
        return newInfo
    }
    
    
}
