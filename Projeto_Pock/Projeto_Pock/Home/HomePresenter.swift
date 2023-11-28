import Foundation
import UIKit

protocol HomePresenterProtocol {
    func setup(view: HomeViewControllerProtocol)
    func fetchData()
    func firstButtonTouched()
    func secondButtonTouched()
}

protocol HomeViewControllerProtocol: AnyObject {
    func render(_ viewModel: HomeViewModel)
}

final class HomePresenter: HomePresenterProtocol {
    
    private weak var view: HomeViewControllerProtocol?
    private var coordinator: HomeCoordinatorProtocol
    
    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func setup(view: HomeViewControllerProtocol) {
        self.view = view
    }
    
    func fetchData() {
        let viewModel = getViewModel()
        view?.render(viewModel)
    }
    
    
    private func getViewModel() -> HomeViewModel {
        .init(title: "Projeto_Teste",
              name: "Alan Pitanga dos Santos",
              age: "33 Anos",
              firstButtonTitle: "pushViewController",
              secondButtonTitle: "presentViewController")
    }
    
    func firstButtonTouched() {
        coordinator.goToPush()
    }
    
    func secondButtonTouched() {
        coordinator.goToPresent()
    }
}
