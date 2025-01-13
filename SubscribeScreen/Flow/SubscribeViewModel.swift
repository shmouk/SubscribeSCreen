import UIKit

final class SubscribeViewModel {
    let apimanager = APIManager.shared
    let tableManager: SubscribeTableManagement
    
    var didPurchased: (() -> Void)?
    var didRestored: (() -> Void)?
    var didTapWeekly: (() -> Void)?
    var didTapMonthly: (() -> Void)?
    var didTapYearly: (() -> Void)?
    
    init(_ tableManager: SubscribeTableManagement = SubscribeTableManager()) {
        self.tableManager = tableManager
    }
    
    func attach(_ tableView: UITableView) {
        tableManager.attach(tableView)
    }
    
    func update() {
        let subscriptionArray = apimanager.subscriptionsArray[safe: 0]
        let price = subscriptionArray?.localizedPrice ?? R.string.localizable.subscribeCellPrice()
        let crossedPrice = subscriptionArray?.localizedCrossedPrice ?? R.string.localizable.subscribeCellCrossedPrice()
        var output: [SubscribeCellConfiguration] = []
        
        output.append(
            makePlansConfigurator(
                with: .init(
                    type: .weekly,
                    title: R.string.localizable.subscribeCellTitle(),
                    subtitle: R.string.localizable.subscribeCellSubtitle(),
                    price: price,
                    crossedPrice: crossedPrice
                )
            )
        )
        
        output.forEach { configurator in
            configurator.didTapCell = { [weak self] in
                guard let self = self else { return }
                switch configurator.type {
                case .weekly:
                    self.didTapWeekly?()
                    
                }
            }
        }
        tableManager.update(with: output)
    }
    
    func restore() {
        apimanager.restore { [weak self] success in
            if success {
                self?.didRestored?()
            }
        }
    }
    
    func purchase(_ type: SubscriptionType) {
        switch type {
        case .weekly:
            apimanager.subscribeToWeeklyTrial { [weak self] result in
                if result {
                    self?.didPurchased?()
                }
            }
        }
    }
}

private extension SubscribeViewModel {
    func makePlansConfigurator(with model: SubscribeCellModel) -> SubscribeCellConfigurator {
        let configurator = SubscribeCellConfigurator(model)
        return configurator
    }
}
