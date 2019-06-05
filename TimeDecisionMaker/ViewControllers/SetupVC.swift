//
//  SetupVC.swift
//  TimeDecisionMaker
//
//  Created by Bogachov on 6/05/19.
//

import Foundation

protocol SetupVCDelegate: class {
}

final class SetupVCC: ConfigurationVC {
    var delegate: SetupVCDelegate?
}

final class SetupVC: BaseVC, ConfigurableVC {
    fileprivate weak var delegate: SetupVCDelegate?
    
    init(configuration: SetupVCC) {
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

extension SetupVC {
    override func loadStaticViews() {
        super.loadStaticViews()
        
        
    }
}
