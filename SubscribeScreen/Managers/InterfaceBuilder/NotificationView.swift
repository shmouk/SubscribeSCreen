import UIKit

class NotificationView: UIView {
    private let builder = UIBuilder.shared
    
    lazy var titleLabel = builder.createLabel(
        textColor: .white,
        fontSize: 15,
        textAlignment: .left
    )
    
    lazy var subtitleLabel = builder.createLabel(
        textColor: .white,
        fontSize: 14,
        textAlignment: .left
    )
    
    lazy var dateLabel = builder.createLabel(
        text: R.string.localizable.subscribeNotificationDate(),
        textColor: .white,
        fontSize: 13,
        textAlignment: .right
    )
    
    lazy var blurView: UIView = {
        let view = builder.createView(
            color: .clear
        )
        builder.addBlur(to: view)
        return view
    }()
    
    lazy var imageView = builder.createImageView()
    
    init(title: String, subtitle: String, image: UIImage?) {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        imageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    private func setupView() {
        self.layer.cornerRadius = 24
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.alpha = 0.5
        self.addSubviews(
            blurView
        )
        
        blurView.addSubviews(
            titleLabel,
            subtitleLabel,
            imageView,
            dateLabel
        )
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: self.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: blurView.topAnchor, constant: 14),
            imageView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 14),
            imageView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 38),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            subtitleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            subtitleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -22),
            dateLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 26),
            dateLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)
        ])
    }
}
