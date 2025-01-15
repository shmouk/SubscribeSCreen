import AudioToolbox
import UIKit

class SubscribeViewController: BaseViewController {
    private let builder = UIBuilder.shared
    
    lazy var bgView = builder.createView(
        color: R.color.gray(),
        cornerRadius: 14
    )

    lazy var bottomNatificationView: UIView = {
        let view = builder.createView(
            color: .clear
        )
        builder.addBlur(to: view)
        return view
    }()

    lazy var closeImageView = builder.createImageView(image: R.image.closeLogo())

    lazy var continueButton = builder.createButton(
        backgroundColor: R.color.black(),
        title: R.string.localizable.commonContinue(),
        titleFontSize: 16,
        cornerRadius: 10
    )

    lazy var dataNotificationView: UIView = NotificationView(
        title: R.string.localizable.subscribeNotificationDataTitle(),
        subtitle: R.string.localizable.subscribeNotificationDataSubtitle(),
        image: R.image.cardWarningLogo()
    )

    lazy var dateTitleLabel = builder.createLabel(
        text: Constants.getCurrentDateAndTime().date,
        textColor: .white,
        fontSize: 14
    )

    lazy var iphoneImageView = builder.createImageView(image: R.image.iphoneLogo())

    lazy var middleNatificationView: UIView = {
        let view = builder.createView(
            color: .clear
        )
        builder.addBlur(to: view)
        return view
    }()

    lazy var privacyLabel = builder.createLabel(
        text: R.string.localizable.commonPrivacy(),
        textColor: R.color.lightGray(),
        fontSize: 14
    )

    lazy var protectNotificationView: UIView = NotificationView(
        title: R.string.localizable.subscribeNotificationProtectTitle(),
        subtitle: R.string.localizable.subscribeNotificationProtectSubtitle(),
        image: R.image.warningLogo()
    )

    lazy var restoreLabel = builder.createLabel(
        text: R.string.localizable.commonRestore(),
        textColor: R.color.lightGray(),
        fontSize: 14
    )

    lazy var saleGiftImageView = builder.createImageView(image: R.image.giftLogo())

    lazy var saleLabel = builder.createLabel(
        text: R.string.localizable.subscribeSave(),
        textColor: .white,
        fontSize: 20,
        isBold: true,
        letterSpacing: -0.5
    )

    lazy var saleView: UIView = {
        let view = builder.createView(
            color: R.color.red(),
            cornerRadius: 18
        )
        builder.addBorder(to: view, borderWidth: 1, borderColor: R.color.borderRed())
        return view
    }()

    lazy var separatorLeftView = builder.createView(
        color: R.color.lightGray(),
        cornerRadius: 2
    )

    lazy var separatorRightView = builder.createView(
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

    lazy var timeTitleLabel = builder.createLabel(
        text: Constants.getCurrentDateAndTime().time,
        textColor: .white,
        fontSize: 72,
        isBold: true,
        letterSpacing: -2
    )

    lazy var timerSubtitleLabel = builder.createLabel(
        text: R.string.localizable.subscribeTimerSubtitle(),
        fontSize: 14,
        letterSpacing: -0.5
    )

    lazy var timerTitleLabel = builder.createLabel(
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
    
    var timer: Timer?
    private var remainingTime: Int = 90
    
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
        continueButton.addPulsation() // представление контроллера еще не готово по этому запускаем анимашку после появления контроллера на экране
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
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .coverVertical
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        self.view.addSubviews(
            continueButton,
            closeImageView,
            iphoneImageView,
            dateTitleLabel,
            timeTitleLabel,
            protectNotificationView,
            bottomNatificationView,
            middleNatificationView,
            dataNotificationView,
            bgView,
            restoreLabel,
            termsLabel,
            privacyLabel,
            separatorLeftView,
            separatorRightView
        )
        
        self.saleView.addSubviews(
            saleLabel,
            saleGiftImageView
        )
        
        self.bgView.addSubviews(
            saleView,
            subscriptionPlansTableView,
            timerSubtitleLabel,
            timerTitleLabel,
            titleLabel,
            subtitleLabel
        )
    }
    
    private func setupResponsibilities() {
        let closeTapped = UITapGestureRecognizer(target: self, action: #selector(tappedOnClose(gesture:)))
        closeImageView.addGestureRecognizer(closeTapped)
        
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
private extension SubscribeViewController {
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
        
        dateTitleLabel.text = Constants.getCurrentDateAndTime().date
        timeTitleLabel.text = Constants.getCurrentDateAndTime().time
        if remainingTime > 0 {
            remainingTime -= 1
            timerTitleLabel.text = TimeUtils.formatTime(remainingTime)
        } else {
            didTapClose?()
        }
    }
}
