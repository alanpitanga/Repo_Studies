import Foundation
import UIKit

protocol ListLanguagePresenterProtocol {
    func setup(view: ListLanguageViewControllerProtocol)
    func fetchData()
}

protocol ListLanguageViewControllerProtocol: AnyObject {
    func render(_ viewModel: ListLanguageViewModel)
}

final class ListLanguagePresenter: ListLanguagePresenterProtocol {
    
    private weak var view: ListLanguageViewControllerProtocol?
    private var coordinator: ListLanguageCoordinatorProtocol
    private var response: ListLanguageResponse.Language?
    
    init(coordinator: ListLanguageCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func setup(view: ListLanguageViewControllerProtocol) {
        self.view = view
    }
    
    func fetchData() {
        let viewModel = getListViewModel()
        view?.render(viewModel)
    }

    private func getListViewModel() -> ListLanguageViewModel {
        
        .init(title: "Linguagens de Programação",
              selector: ["Front", "Back"],
              selectedIndex: 1,
              rows: [.init(id: "1",
                           title: "Swift",
                           description: "Front-End")])
    }
}
