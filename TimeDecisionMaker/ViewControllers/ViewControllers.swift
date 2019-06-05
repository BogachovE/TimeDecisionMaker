import Foundation
import UIKit

enum ViewControllers: Equatable {
    case main(MainVC.Configuration.ConfigurationClosure)
    case events(EventsVC.Configuration.ConfigurationClosure)
    case setup(SetupVC.Configuration.ConfigurationClosure)
    
    
    var vc: UIViewController {
        let vc: UIViewController
        switch self {
        case .main(let config):
            vc = MainVC(configuration: MainVC.Configuration(configurationClosure: config))
        case .events(let config):
            vc = EventsVC(configuration: EventsVC.Configuration(configurationClosure: config))
        case .setup(let config):
            vc = SetupVC(configuration: SetupVC.Configuration(configurationClosure: config))
        }
        return vc
    }
    
    func vc_<T: ConfigurableVC>() -> T {
        return vc as! T
    }
    
    var nav: UINavigationController {
        return navVc.nav
    }
    
    var navVc: (nav: UINavigationController, vc: UIViewController) {
        let vc = self.vc
        let nav = UINavigationController(rootViewController: vc)
        return (nav, vc)
    }
    
    static func == (lhs: ViewControllers, rhs: ViewControllers) -> Bool {
        return lhs.vc.hashValue == rhs.vc.hashValue
    }
}
