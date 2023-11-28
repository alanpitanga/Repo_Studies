import Foundation
import UIKit
import Tanjiro

final class ListLanguageCell: UITableViewCell {
    
    static let indentifier: String = "ListLanguageCell"
    
    private let containerStack = UIStackView().with {
        $0.axis = .vertical
        $0.spacing = 2
    }
    
    private let labelId = UILabel().with {
        $0.textColor = .white
    }

    private let labelTitle = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .white
    }
    
    private let labelDescription = UILabel().with {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .white
    }
    
    private let separatorView = UIView().with {
        $0.backgroundColor = UIColor(red: 0.63, green: 0.65, blue: 0.67, alpha: 0.4)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        self.initSubView()
        self.configureConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initSubView() {
        addSubview(labelId)
        addSubview(containerStack)
        containerStack.addArrangedSubview(labelTitle)
        containerStack.addArrangedSubview(labelDescription)
    }
    
    private func configureConstrains() {
        
        labelId.layout {
            $0.leading.equalToSuperView(10)
            $0.centerY.equalToSuperView()
        }
        
        containerStack.layout {
            $0.top.equalToSuperView(10)
            $0.leading.equal(to: labelId.trailingAnchor, offsetBy: 20)
            $0.trailing.greaterThanOrEqualToSuperView(-300)
            $0.bottom.equalToSuperView(-10)
        }
        
        separatorView.layout {
            $0.leading.equalToSuperView()
            $0.trailing.equalToSuperView()
            $0.bottom.equalToSuperView(-7)
            $0.height.constraint(equalToConstant: 2)
        }
    }
    
    func render(_ viewModel: ListLanguageViewModel.Rows) {
        labelId.text = viewModel.id
        labelTitle.text = viewModel.title
        labelDescription.text = viewModel.description
    }
}
