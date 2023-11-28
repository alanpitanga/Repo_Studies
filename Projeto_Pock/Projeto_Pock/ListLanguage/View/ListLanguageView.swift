import Foundation
import UIKit
import Tanjiro

protocol ListLanguageViewProtocol where Self: UIView {
    func render(_ viewModel: ListLanguageViewModel)
    func setup(delegate: ListLanguageViewDelegate)
    func reloadData()
}

protocol ListLanguageSelectionViewDelegate: AnyObject {
    func didSelectSegmented(at index: Int)
}

typealias ListLanguageViewDelegate = UITableViewDelegate & UITableViewDataSource

final class ListLanguageView: UIView, ListLanguageViewProtocol {
    
    private lazy var segmentedControl = UISegmentedControl().with {
        $0.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        $0.selectedSegmentTintColor = .darkGray
        $0.selectedSegmentIndex = 0
        $0.addTarget(self, action: #selector(indexChanged(_ :)), for: .valueChanged)
    }
    
    private let titleLabel = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let tableView = UITableView(frame: .zero, style: .plain).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = false
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.backgroundColor = .black
        $0.register(ListLanguageCell.self, forCellReuseIdentifier: ListLanguageCell.indentifier)
    }
        
    private weak var delegate: ListLanguageSelectionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
        self.configureConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView() {
        addSubview(segmentedControl)
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    private func configureConstrains() {
        
        titleLabel.layout {
            $0.top.equalToSuperView(100)
            $0.leading.equalToSuperView(10)
            $0.trailing.equalToSuperView(-10)
            $0.centerX.equalToSuperView()
        }
        
        segmentedControl.layout {
            $0.top.lessThanOrEqual(to: titleLabel.bottomAnchor, offsetBy: 40)
            $0.height.constraint(equalToConstant: 24)
            $0.width.constraint(equalToConstant: 142)
            $0.centerX.equalToSuperView()
        }
       
        tableView.layout {
            $0.top.equal(to: segmentedControl.bottomAnchor, offsetBy: 10)
            $0.leading.equalToSuperView(16)
            $0.trailing.equalToSuperView(-16)
            $0.bottom.equalToSuperView(-16)
        }
    }
    
    @objc func indexChanged(_ segmentedControl: UISegmentedControl) {
        didChangeSelector()
    }
    
    private func didChangeSelector() {
        self.delegate?.didSelectSegmented(at: segmentedControl.selectedSegmentIndex)
    }
    
    func setup(delegate: ListLanguageViewDelegate) {
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func render(_ viewModel: ListLanguageViewModel) {
        titleLabel.text = viewModel.title
        
        viewModel.selector.enumerated().forEach {
            segmentedControl.insertSegment(withTitle: $0.element, at: $0.offset, animated: false)
        }
        
        segmentedControl.selectedSegmentIndex = viewModel.selectedIndex
    }
}
