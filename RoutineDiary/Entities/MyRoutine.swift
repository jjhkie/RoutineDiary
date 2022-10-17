

import Foundation


struct MyRoutine: Codable{
    var title: String
    var category: String
    //var startDay: Date
    var content: String
    var goalContent: String
    var today: Bool
    var count: Int
    var percent: Double
    
    init(title: String, category: String, content: String, goalContent: String, today: Bool, count: Int, percent: Double) {
        self.title = title
        self.category = category
        self.content = content
        self.goalContent = goalContent
        self.today = today
        self.count = count
        self.percent = percent
    }
}
