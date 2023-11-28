import Foundation
import UIKit

protocol ListLanguageCoordinatorProtocol {
    
}

final class ListLanguageCoordinator: Coordinator, ListLanguageCoordinatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let presenter = ListLanguagePresenter(coordinator: self)
        let customView = ListLanguageView()
        let viewController = ListLanguageViewController(presenter: presenter, customView: customView)
        
        presenter.setup(view: viewController)
        customView.setup(delegate: viewController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
