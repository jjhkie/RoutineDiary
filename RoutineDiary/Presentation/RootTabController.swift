
import UIKit

class RootTabController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarViewControllers: [UIViewController] = TabBarItem.allCases
            .map{ tabValue in
                let viewController = tabValue.viewController
                viewController.tabBarItem = UITabBarItem(title: tabValue.title,
                                                         image: tabValue.icon.default,
                                                         selectedImage: tabValue.icon.selected)
                
                return viewController
            }

        self.viewControllers = tabBarViewControllers
        
    }
    
}
