
import UIKit


class RootTabController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Today Tab
        let today = UINavigationController(rootViewController: TodayViewController())
        today.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "clock.arrow.circlepath"), selectedImage: nil)
        
        // Day Tab
        let day = UINavigationController(rootViewController: DayViewController())
        day.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "list.bullet.clipboard"), selectedImage: UIImage(systemName: "list.bullet.clipboard"))
 
        //Routine Tab
        let routine = UINavigationController(rootViewController: RoutineViewController())
        routine.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "list.dash"), selectedImage: UIImage(systemName: "list.dash"))
        
        viewControllers = [today, day, routine]
        
    }
    
}
