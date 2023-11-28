import Foundation
import UIKit
import Tanjiro

protocol HomeViewProtocol where Self: UIView {
    func setup(delegate: HomeViewDelegate)
    func render(_ viewModel: HomeViewModel)
}

protocol HomeViewDelegate: AnyObject {
    func firstButtonTouched()
    func secondButtonTouched()
}

final class HomeView: UIView, HomeViewProtocol {
    
    private let containerView = UIView().with {
        $0.backgroundColor = .white
    }
    
    private let containerStack = UIStackView().with {
        $0.spacing = 8
        $0.axis = .vertical
    }
    
    private let labelName = UILabel().with {
        $0.font = UIFont(name: "roboto", size: 10)
        $0.textColor = .black
    }
    
    private let labelAge = UILabel().with {
        $0.textColor = .black
    }
    
    private let stackButton = UIStackView().with {
        $0.spacing = 8
        $0.axis = .vertical
    }
    
    private let firstButton = UIButton().with {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .gray
        $0.addTarget(self, action: #selector(firstButtonTouched), for: .touchUpInside)
    }
    
    private let secondButton = UIButton().with {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .green
        $0.addTarget(self, action: #selector(secondButtonTouched), for: .touchUpInside)
    }
    
    private weak var delegate: HomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
        self.configureConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView() {
        //todo: mudar o nome da containerStack
        addSubview(containerView)
        containerView.addSubview(containerStack)
        containerStack.addArrangedSubview(labelName)
        containerStack.addArrangedSubview(labelAge)
        containerView.addSubview(stackButton)
        stackButton.addArrangedSubview(firstButton)
        stackButton.addArrangedSubview(secondButton)
    }
    
    private func configureConstrains() {
        containerView.layout {
            $0.top.equalToSuperView(200)
            $0.leading.equalToSuperView(40)
            $0.trailing.equalToSuperView(-40)
            //todo: colocar um bottom
        }
        
        containerStack.layout {
            $0.top.equalToSuperView(30)
            $0.centerX.equalToSuperView()
        }
        
        stackButton.layout {
            //tpdp: colocar como fillEquals
            $0.top.equal(to: containerStack.bottomAnchor, offsetBy: 30)
            $0.bottom.equalToSuperView(-30)
            $0.centerX.equalToSuperView()
        }
        
        firstButton.layout {
            $0.height.constraint(equalToConstant: 40)
            $0.width.constraint(equalToConstant: 223)
        }
        
        secondButton.layout {
            $0.height.constraint(equalToConstant: 40)
            $0.width.constraint(equalToConstant: 223)
        }
    }
    
    func setup(delegate: HomeViewDelegate) {
        self.delegate = delegate
    }
    
    @objc private func firstButtonTouched() {
        delegate?.firstButtonTouched()
    }
    
    @objc private func secondButtonTouched() {
        delegate?.secondButtonTouched()
    }
    
    func render(_ viewModel: HomeViewModel) {
        labelName.text = viewModel.name
        labelAge.text = viewModel.age
        firstButton.setTitle(viewModel.firstButtonTitle, for: .normal)
        secondButton.setTitle(viewModel.secondButtonTitle, for: .normal)
    }
}
