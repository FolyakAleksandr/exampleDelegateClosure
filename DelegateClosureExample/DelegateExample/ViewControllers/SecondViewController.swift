import UIKit

final class SecondViewController: UIViewController {
    // MARK: - Private properties
    
    private let nameLabel = UILabel()
    
    // MARK: - Public variables
    
    public weak var delegate: FirstViewControllerDelegate?
    public var closure: (() -> (String))?
    
    // MARK: - Lyfe cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundVC()
        setupUI()
    }
    
    // MARK: - Methods

    private func setupUI() {
        layoutNameLabel()
        configureNameLabel()
    }
    
    private func layoutNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func configureNameLabel() {
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        nameLabel.textColor = .darkGray
        nameLabel.textAlignment = .center
        
        nameLabel.text = delegate?.transferData()
//        nameLabel.text = closure?()
    }
}
