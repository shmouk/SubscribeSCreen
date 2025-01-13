import UIKit

class StartViewController: BaseViewController {
    private let builder = UIBuilder.shared
    
    lazy var nextButton = builder.createButton(
        backgroundColor: R.color.black(),
        title: R.string.localizable.commonNext(),
        cornerRadius: 10
    )
    
    var didTapNext: (() -> Void)?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupResponsibilities()
    }
    
    private func setupUI() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        self.view.addSubview(nextButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 240),
            nextButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    private func setupResponsibilities() {
        nextButton.addPulsation()
        nextButton.addTarget(self, action: #selector(self.nextTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension StartViewController {
    @objc
    private func nextTapped() {
        didTapNext?()
    }
}

