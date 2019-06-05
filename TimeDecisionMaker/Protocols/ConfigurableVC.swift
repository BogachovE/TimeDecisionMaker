protocol ConfigurableVC: class {
    associatedtype Configuration: ConfigurationVC
    init(configuration: Configuration)
}

protocol ConfigurationVC {
    typealias ConfigurationClosure = (Self) -> ()
    init()
    init(configurationClosure: ConfigurationClosure)
}

extension ConfigurationVC {
    init(configurationClosure: ConfigurationClosure) {
        self.init()
        configurationClosure(self)
    }
}
