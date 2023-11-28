import UIKit

class ListLanguageViewController: UIViewController, ListLanguageViewControllerProtocol {
    
    private let presenter: ListLanguagePresenterProtocol
    private let customView: ListLanguageViewProtocol
    private var viewModel: ListLanguageViewModel?
    
    init(presenter: ListLanguagePresenterProtocol,
         customView: ListLanguageViewProtocol) {
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
}

extension ListLanguageViewController: ListLanguageViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let list = viewModel?.rows[indexPath.row],
        let cell = tableView.dequeueReusableCell(withIdentifier: ListLanguageCell.indentifier,
                                                 for: indexPath) as? ListLanguageCell else {
            return UITableViewCell()
        }
        cell.render(list)
        return cell
    }
}

extension ListLanguageViewController {
    func render(_ viewModel: ListLanguageViewModel) {
        self.viewModel = viewModel
        customView.render(viewModel)
        customView.reloadData()
    }
}
