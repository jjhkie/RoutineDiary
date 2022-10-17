
import UIKit

enum TabBarItem: CaseIterable{
    case today
    case day
    case routine
    
    var title: String{
        switch self{
        case .today:
            return "Today"
        case .day:
            return "Day"
        case .routine:
            return "Routine"
        }
    }
    
    var icon: (default: UIImage?, selected: UIImage?){
        switch self{
        case .today:
            return ( UIImage(systemName: "clock.arrow.circlepath"), UIImage(systemName: "clock.arrow.circlepath"))
        case .day:
            return (UIImage(systemName: "list.bullet.clipboard"),UIImage(systemName: "list.bullet.clipboard"))
        case .routine:
            return (UIImage(systemName: "list.dash"),UIImage(systemName: "list.dash"))
        }
    }
    
    
    var viewController: UIViewController{
        switch self{
        case .today:
            return UINavigationController(rootViewController: TodayViewController())
        case .day:
            return UINavigationController(rootViewController: DayViewController())
        case .routine:
            return UINavigationController(rootViewController: RoutineViewController())
        }
    }
}
