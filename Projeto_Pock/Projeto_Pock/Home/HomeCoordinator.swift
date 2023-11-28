import Foundation
import UIKit

protocol HomeCoordinatorProtocol {
    func goToPush()
    func goToPresent()
}

final class HomeCoordinator: Coordinator, HomeCoordinatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let presenter = HomePresenter(coordinator: self)
        
        let customView = HomeView()
        let viewController = HomeViewController(presenter: presenter, customView: customView)
        
        presenter.setup(view: viewController)
        customView.setup(delegate: viewController)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToPush() {
        ListLanguageCoordinator.init(navigationController: navigationController).start()
    }
    
    func goToPresent() {
        NextFlowCoordinator.init(navigationController: navigationController).start()
    }
}
