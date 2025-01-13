import UIKit

final class SubscribeCellConfigurator: SubscribeCellConfiguration {
    var type: SubscriptionType
    var didTapCell: (() -> Void)?
    
    var cellIdentifier = String(describing: SubscribeTableViewCell.self)
    var model: SubscribeCellModel
    
    func configureCell(_ cell: UIView) {
        guard let cell = cell as? SubscribeTableViewCell else { return }
        cell.configure(with: model)
    }
    
    init(_ model: SubscribeCellModel) {
        self.model = model
        self.type = model.type
    }
}
