import UIKit

final class SubscribeTableViewCell: UITableViewCell {
    private let builder = UIBuilder.shared
    
    private lazy var containerBackgroundView = builder.createTableCellBackground(
        hasBorder: true,
        borderColor: .clear
    )
    private lazy var titleLabel = builder.createLabel(textAlignment: .left, isBold: true)
    private lazy var subtitleLabel = builder.createLabel(fontSize: 14, textAlignment: .left)
    private lazy var priceLabel = builder.createLabel(textAlignment: .right, isBold: true)
    private lazy var crossedPriceLabel = builder.createLabel(fontSize: 14, textAlignment: .right)
    
    var model: SubscribeCellModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        contentView.isUserInteractionEnabled = true
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        contentView.isUserInteractionEnabled = true
        selectionStyle = .none
    }
    
    func configure(with model: SubscribeCellModel) {
        self.model = model
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        priceLabel.text = model.price
        
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .strikethroughColor: R.color.black()
        ]
        let attributedString = NSAttributedString(string: model.crossedPrice, attributes: attributes)
        crossedPriceLabel.attributedText = attributedString
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(containerBackgroundView)
        containerBackgroundView.addSubviews(
            titleLabel,
            subtitleLabel,
            priceLabel,
            crossedPriceLabel
        )
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            containerBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerBackgroundView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: containerBackgroundView.leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: containerBackgroundView.bottomAnchor, constant: -13),
            subtitleLabel.leadingAnchor.constraint(equalTo: containerBackgroundView.leadingAnchor, constant: 20),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.trailingAnchor.constraint(equalTo: containerBackgroundView.trailingAnchor, constant: -19),
            priceLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            crossedPriceLabel.trailingAnchor.constraint(equalTo: containerBackgroundView.trailingAnchor, constant: -19),
            crossedPriceLabel.centerYAnchor.constraint(equalTo: subtitleLabel.centerYAnchor),
            crossedPriceLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
}
