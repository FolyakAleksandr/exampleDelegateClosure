import UIKit

final class SecondViewController: UIViewController {
    // MARK: - Private properties
    
    private let nameLabel = UILabel()
    
    // MARK: - Lyfe cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundVC()
        
        setupUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? FirstViewController else { return }
        destination.delegateName = self
        destination.closure = { [weak self] text in
            guard let self = self else { return }
            self.nameLabel.text = text
        }
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
    }
}

// MARK: - Extension

extension SecondViewController: SecondViewControllerDelegate {
    func transferData(name: String) {
        nameLabel.text = name
    }
}
