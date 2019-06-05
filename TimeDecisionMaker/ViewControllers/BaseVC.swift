import Foundation
import UIKit

class BaseVC: UIViewController {
    final var statusBarStyle: UIStatusBarStyle = .default
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    /// Analytics
    var screenName: String? {
        return navigationItem.title
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = view.backgroundColor ?? .white
        loadStaticViews()
        loadStaticNavigationBar()
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        UIView.animate(withDuration: 0) { [weak self] in self?.loadDynamicViews() }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func updateViewConstraints() {
        updateConstraints()
        super.updateViewConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutSubviews()
    }
}

// MARK: - LoadViewsVCProtocol
@objc extension BaseVC: LoadViewsVCProtocol {
    func loadStaticViews() {}
    func loadDynamicViews() {}
    func updateConstraints() {}
    func layoutSubviews() {}
    func loadStaticNavigationBar() {}
    func setupNavigationBar() {
        navigationBar(withColor: Colors.navBar, andHiddenShadow: false)
        navigationBar(translucentIsOn: true)
    }
}

// MARK: - NavigationBarCustomizationProtocol
extension BaseVC: NavigationBarAppearanceProtocol { }

