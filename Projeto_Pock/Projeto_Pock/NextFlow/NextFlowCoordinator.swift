import Foundation
import UIKit

protocol NextFlowCoordinatorProtocol {
}

final class NextFlowCoordinator: Coordinator, NextFlowCoordinatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = NextFlowViewController()
        navigationController.present(viewController, animated: true)
    }
}
