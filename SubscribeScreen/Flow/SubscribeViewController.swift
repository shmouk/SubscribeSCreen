import AudioToolbox
import UIKit

class SubscribeViewController: BaseViewController {
    private let builder = UIBuilder.shared
    
    lazy var bgView = builder.createView(
        color: R.color.gray(),
        cornerRadius: 14
    )

    lazy var closeImage = builder.createImageView(image: R.image.closeLogo())

    lazy var continueButton = builder.createButton(
        backgroundColor: R.color.black(),
        title: R.string.localizable.commonContinue(),
        titleFontSize: 16,
        cornerRadius: 10
    )
    
    lazy var dateTitle = builder.createLabel(
        text: Constants.getCurrentDateAndTime().date,
        textColor: .white,
        fontSize: 14
    )
    
    lazy var iphoneImageView = builder.createImageView(image: R.image.iphoneLogo())

    lazy var middleNotificationImageView = builder.createImageView(image: R.image.notificationMiddleLogo())

    lazy var privacyLabel = builder.createLabel(
        text: R.string.localizable.commonPrivacy(),
        textColor: R.color.lightGray(),
        fontSize: 14
    )

    lazy var restoreLabel = builder.createLabel(
        text: R.string.localizable.commonRestore(),
        textColor: R.color.lightGray(),
        fontSize: 14
    )

    lazy var saleImageView = builder.createImageView(image: R.image.saleLogo())

    lazy var separatorLeft = builder.createView(
        color: R.color.lightGray(),
        cornerRadius: 2
    )

    lazy var separatorRight = builder.createView(
        color: R.color.lightGray(),
        cornerRadius: 2
    )

    lazy var subtitleLabel = builder.createLabel(
        text: R.string.localizable.subscribeSubtitle(),
        fontSize: 16,
        letterSpacing: -0.5
    )

    lazy var subscriptionPlansTableView = builder.createTableView()

    lazy var termsLabel = builder.createLabel(
        text: R.string.localizable.commonTerms(),
        textColor: R.color.lightGray(),
        fontSize: 14
    )
    
    lazy var timeTitle = builder.createLabel(
        text: Constants.getCurrentDateAndTime().time,
        textColor: .white, 
        fontSize: 72,
        isBold: true,
        letterSpacing: -2
    )
    
    lazy var timerSubtitle = builder.createLabel(
        text: R.string.localizable.subscribeTimerSubtitle(),
        fontSize: 14,
        letterSpacing: -0.5
    )

    lazy var timerTitle = builder.createLabel(
        text: "01 : 30",
        fontSize: 20,
        isBold: true,
        letterSpacing: -0.5
    )

    lazy var titleLabel = builder.createLabel(
        text: R.string.localizable.subscribeTitle(),
        fontSize: 18,
        isBold: true,
        letterSpacing: -0.5
    )

    lazy var topNotificationImageView = builder.createImageView(image: R.image.notificationTopLogo())
    var timer: Timer?
    private var remainingTime: Int = 90
    
    let defaults = UserDefaultsManager.shared
    private let viewModel: SubscribeViewModel
    
    var didRestored: (() -> Void)?
    var didTapClose: (() -> Void)?
    var didTapPrivacyPolicy: (() -> Void)?
    var didTapTerms: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupResponsibilities()
        viewModel.attach(subscriptionPlansTableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.update()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        continueButton.addPulsation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }

    init(viewModel: SubscribeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        self.view.addSubviews(
            continueButton,
            closeImage,
            iphoneImageView,
            dateTitle,
            timeTitle,
            topNotificationImageView,
            middleNotificationImageView,
            bgView,
            restoreLabel,
            termsLabel,
            privacyLabel,
            separatorLeft,
            separatorRight
        )

        self.bgView.addSubviews(
            saleImageView,
            subscriptionPlansTableView,
            timerSubtitle,
            timerTitle,
            titleLabel,
            subtitleLabel
        )
    }
    
    private func setupResponsibilities() {
        let closeTapped = UITapGestureRecognizer(target: self, action: #selector(tappedOnClose(gesture:)))
        closeImage.addGestureRecognizer(closeTapped)
        
        let privacyTap = UITapGestureRecognizer(target: self, action: #selector(tappedOnPrivacyLabel(gesture:)))
        privacyLabel.addGestureRecognizer(privacyTap)
        
        let restoreTap = UITapGestureRecognizer(target: self, action: #selector(tappedOnRestoreLabel(gesture:)))
        restoreLabel.addGestureRecognizer(restoreTap)
        
        let termsTap = UITapGestureRecognizer(target: self, action: #selector(tappedOnTermsLabel(gesture:)))
        termsLabel.addGestureRecognizer(termsTap)
        
        viewModel.didRestored = { [weak self] in
            self?.didRestored?()
        }
        
        viewModel.didPurchased = { [weak self] in
            self?.didTapClose?()
        }
        
        viewModel.didTapWeekly = { [weak self] in
            self?.weeklyTapped()
        }
        
        continueButton.addTarget(self, action: #selector(tappedContinue), for: .primaryActionTriggered)
    }
}

// MARK: - Actions
extension SubscribeViewController {
    @objc
    private func tappedOnClose(gesture: UITapGestureRecognizer) {
        didTapClose?()
    }
    
    @objc
    private func tappedContinue() {
        // TODO: Initial purchase subscribe
        initiatePurchase()
    }
    
    private func initiatePurchase() {
        var cells = [SubscribeTableViewCell]()
        
        subscriptionPlansTableView.visibleCells.forEach { if let cell = $0 as? SubscribeTableViewCell { cells.append(cell) } }
        
    }
    
    @objc
    private func tappedOnPrivacyLabel(gesture: UITapGestureRecognizer) {
        // TODO: Tapped on privacy label
        didTapPrivacyPolicy?()
    }
    
    @objc
    private func tappedOnRestoreLabel(gesture: UITapGestureRecognizer) {
        // TODO: Tapped on restore label
        viewModel.restore()
    }
    
    @objc
    private func tappedOnTermsLabel(gesture: UITapGestureRecognizer) {
        // TODO: Tapped on terms label
        didTapTerms?()
    }
    
    private func weeklyTapped() {
        let cells = subscriptionPlansTableView.visibleCells
        for cell in cells {
            if let cell = cell as? SubscribeTableViewCell {
                if cell.model?.type == .weekly { }
            }
        }
        initiatePurchase()
    }
    
    @objc
    private func updateTimer() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        
        dateTitle.text = Constants.getCurrentDateAndTime().date
        timeTitle.text = Constants.getCurrentDateAndTime().time
        if remainingTime > 0 {
            remainingTime -= 1
            timerTitle.text = Constants.formatTime(remainingTime)
        } else {
            didTapClose?()
        }
    }
    
}
