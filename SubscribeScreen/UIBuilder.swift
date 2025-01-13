import Kingfisher
import Lottie
import UIKit

final class UIBuilder {
    static let shared = UIBuilder()
    private init() {}
    
    @MainActor func createButton(
        backgroundColor: UIColor? = .clear,
        title: String? = nil,
        titleFontSize: CGFloat = 16,
        titleColor: UIColor? = .white,
        isTitleBold: Bool = true,
        imageUrl: String? = nil,
        cornerRadius: CGFloat? = nil
    ) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = backgroundColor
        if let title {
            button.setTitle(title, for: .normal)
        }
        button.titleLabel?.font = UIFont.systemFont(ofSize: titleFontSize, weight: isTitleBold ? .semibold : .regular)
        button.setTitleColor(titleColor, for: .normal)
        if let imageUrl, let url = URL(string: imageUrl) {
            button.kf.setImage(with: url, for: .normal)
        }
        if let cornerRadius {
            button.layer.cornerRadius = cornerRadius
        }
        return button
    }
    
    @MainActor func createImageView(
        image: UIImage? = nil,
        imageURL: String? = nil,
        cornerRadius: CGFloat? = nil,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        isUserInteractionEnabled: Bool = true
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = contentMode
        imageView.isUserInteractionEnabled = isUserInteractionEnabled
        if let imageURL {
            imageView.kf.setImage(with: URL(string: imageURL))
        } else if let image {
            imageView.image = image
        }
        if let cornerRadius {
            imageView.layer.cornerRadius = cornerRadius
        }
        return imageView
    }
    
    func createLabel(
        text: String? = nil,
        textColor: UIColor? = R.color.black(),
        fontSize: CGFloat = 16,
        textAlignment: NSTextAlignment = .center,
        isBold: Bool = false,
        numberOfLines: Int = 0
    ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.font = isBold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.isUserInteractionEnabled = true
        return label
    }
    
    func createLottieView() -> LottieAnimationView {
        let imageView = LottieAnimationView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }
    
    func createProgressBar(
        tintColor: UIColor = .blue,
        trackTintColor: UIColor = .gray
    ) -> UIProgressView {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .bar
        progressView.setProgress(0.0, animated: false)
        progressView.tintColor = tintColor
        progressView.trackTintColor = trackTintColor
        return progressView
    }
    
    func createScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }
    
    func createSwitch() -> UISwitch {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
    }
    
    func createTableCellBackground(
        color: UIColor = .white,
        hasBorder: Bool = false,
        borderColor: UIColor?
    ) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        if hasBorder {
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 12
            view.layer.borderColor = borderColor?.cgColor
        }
        view.isUserInteractionEnabled = true
        return view
    }
    
    func createTableView(
        cornerRadius: CGFloat? = nil
    ) -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        if let cornerRadius {
            tableView.layer.cornerRadius = cornerRadius
            tableView.clipsToBounds = true
        }
        tableView.isUserInteractionEnabled = true
        return tableView
    }
    
    func createTextField(
        placeholder: String? = nil,
        keyboardType: UIKeyboardType = .emailAddress,
        returnKeyType: UIReturnKeyType = .search
    ) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: R.color.black()]
        )
        textField.keyboardType = keyboardType
        textField.returnKeyType = returnKeyType
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.smartInsertDeleteType = .no
        textField.autocapitalizationType = .none
        return textField
    }
    
    func createView(
        color: UIColor? = .white,
        cornerRadius: CGFloat? = nil,
        clipsToBounds: Bool = false
    ) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        if let cornerRadius {
            view.layer.cornerRadius = cornerRadius
        }
        view.clipsToBounds = clipsToBounds
        view.isUserInteractionEnabled = true
        return view
    }
}
