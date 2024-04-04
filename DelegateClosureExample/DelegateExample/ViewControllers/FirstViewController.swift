import UIKit

final class FirstViewController: UIViewController {
    // MARK: - Private properties
    
    private let nameTextField = UITextField()
    private let sendButton = UIButton()
    
    // MARK: - Private variables

    private var helperModel = DataFromTextField()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundVC()
        setupUI()
    }
    
    // MARK: - Methods

    private func setupUI() {
        layoutNameTextField()
        configureNameTextField()
        layoutSendButton()
        configureSendButton()
    }
    
    private func layoutNameTextField() {
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            nameTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func configureNameTextField() {
        nameTextField.placeholder = "Введите имя"
        nameTextField.borderStyle = .roundedRect
        nameTextField.textColor = .darkGray
    }
    
    private func layoutSendButton() {
        view.addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            sendButton.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor),
            sendButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3)
        ])
    }
    
    private func configureSendButton() {
        sendButton.setTitle("Send data", for: .normal)
        sendButton.backgroundColor = .systemBlue
        sendButton.layer.cornerRadius = 10
        sendButton.tintColor = .white
        
        sendButton.addTarget(self, action: #selector(tapSendButton), for: .touchUpInside)
    }
    
    @objc private func tapSendButton() {
        guard let textNameTextField = nameTextField.text else { return }
        helperModel.data = textNameTextField
        
        let vc = SecondViewController()
        vc.delegate = self
        
        vc.closure = {
            return textNameTextField
        }
        
        navigationController?.pushViewController(vc, animated: true)
        nameTextField.text = ""
    }
}

// MARK: - Extension

extension FirstViewController: FirstViewControllerDelegate {
    func transferData() -> String {
        return helperModel.data
    }
}
