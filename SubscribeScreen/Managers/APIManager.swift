// TODO: Some API's functions

import Foundation

enum SubscriptionType {
    case weekly

    func subscriptions() -> [Subscription] {
        switch self {
        case .weekly:
            return [
                Subscription(price: 29.99, crossedPrice: 49.99, currency: "$")
            ]
        }
    }
}

struct Subscription {
    let price: Double
    let crossedPrice: Double
    let currency: String

    var localizedPrice: String {
        String(format: "%.2f %@", price, currency)
    }

    var localizedCrossedPrice: String {
        String(format: "%.2f %@", crossedPrice, currency)
    }
}

final class APIManager {
    static var shared = APIManager()

    var subscriptionsArray: [Subscription] = SubscriptionType.weekly.subscriptions()
    
    private init() { }
    
    func restore(completion: @escaping (Bool) -> Void) {
        // TODO: Restore function
        completion(true)
    }
    
    func subscribeToWeeklyTrial(completion: @escaping (Bool) -> Void) {
        // TODO: Restore function
        completion(true)
    }
    
}
