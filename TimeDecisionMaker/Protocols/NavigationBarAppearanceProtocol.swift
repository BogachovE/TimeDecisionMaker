import Foundation
import UIKit

protocol NavigationBarAppearanceProtocol: class {
    func navigationBar(withColor color: UIColor?, andHiddenShadow: Bool)
    func navigationBar(translucentIsOn isOn: Bool)
    
    func navigationBar(setTitleView view: UIView)
}

extension NavigationBarAppearanceProtocol where Self: UIViewController {
    func navigationBar(shadowIsHidden: Bool) {
        if shadowIsHidden {
            navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            navigationController?.navigationBar.shadowImage = nil
        }
    }
    
    func navigationBar(withColor color: UIColor?, andHiddenShadow: Bool = true) {
        let color = color ?? Colors.navBar

        if color == .clear {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        } else {
            navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        }

        navigationController?.navigationBar.barTintColor = color
        setNeedsStatusBarAppearanceUpdate()

        navigationBar(shadowIsHidden: andHiddenShadow)
    }

    func navigationBar(translucentIsOn isOn: Bool) {
        navigationController?.navigationBar.isTranslucent = isOn
    }
    
    func navigationBar(setTitleView view: UIView) {
        navigationItem.titleView = view
    }
}
