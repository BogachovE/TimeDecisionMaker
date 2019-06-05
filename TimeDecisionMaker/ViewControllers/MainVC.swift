//
//  MainVC.swift
//  TimeDecisionMaker
//
//  Created by Mikhail on 4/24/19.
//

import Foundation

protocol MainVCDelegate: class {
}

final class MainVCC: ConfigurationVC {
    var delegate: MainVCDelegate?
}

final class MainVC: BaseVC, ConfigurableVC {
    fileprivate weak var delegate: MainVCDelegate?
    
    init(configuration: MainVCC) {
        self.delegate = configuration.delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc fileprivate func signUpButtonPressed(_ sender: Any) {
        
    }
    
    @objc fileprivate func registerBackDidTaped(_ sender: Any) {
        
    }
}

extension MainVC {
    override func loadStaticViews() {
        super.loadStaticViews()
        

    }
}
