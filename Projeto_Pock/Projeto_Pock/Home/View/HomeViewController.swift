import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    private let presenter: HomePresenterProtocol
    private let customView: HomeViewProtocol
    
    init(presenter: HomePresenterProtocol,
         customView: HomeViewProtocol) {
        self.presenter = presenter
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchData()
    }
    
    func render(_ viewModel: HomeViewModel) {
        customView.render(viewModel)
        title = viewModel.title
    }
}

extension HomeViewController: HomeViewDelegate {
    func firstButtonTouched() {
        presenter.firstButtonTouched()
    }
    
    func secondButtonTouched() {
        presenter.secondButtonTouched()
    }
}
