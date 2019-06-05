//
//  EventsVC.swift
//  TimeDecisionMaker
//
//  Created by Bogachov on 6/05/19.
//

import Foundation

protocol EventsVCDelegate: class {
}

final class EventsVCC: ConfigurationVC {
    var delegate: EventsVCDelegate?
}

final class EventsVC: BaseVC, ConfigurableVC {
    fileprivate weak var delegate: EventsVCDelegate?
    
    init(configuration: EventsVCC) {
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

extension EventsVC {
    override func loadStaticViews() {
        super.loadStaticViews()
        
        
    }
}
