import UIKit

protocol SubscribeCellConfiguration: AnyObject {
    var type: SubscriptionType { get }
    var cellIdentifier: String { get }
    var didTapCell: (() -> Void)? { get set }
    func configureCell(_ cell: UIView)
}

protocol SubscribeTableManagement: AnyObject {
    func attach(_ tableView: UITableView)
    func update(with configurators: [SubscribeCellConfiguration])
}

final class SubscribeTableManager: NSObject, SubscribeTableManagement {
    private var configurators = [SubscribeCellConfiguration]()
    private weak var tableView: UITableView?

    func attach(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self

        let subCellID = String(describing: SubscribeTableViewCell.self)
        tableView.register(SubscribeTableViewCell.self, forCellReuseIdentifier: subCellID)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.isUserInteractionEnabled = true
        self.tableView = tableView
    }

    func update(with configurators: [SubscribeCellConfiguration]) {
        self.configurators = configurators
        tableView?.reloadData()
    }
}

extension SubscribeTableManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        configurators.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = configurators[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: configurator.cellIdentifier, for: indexPath)
        configurator.configureCell(cell)
        return cell
    }
}

extension SubscribeTableManager: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let configurator = configurators[indexPath.section]
        configurator.didTapCell?()
    }
}
