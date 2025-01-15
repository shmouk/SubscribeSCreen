import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var didFinish: (() -> Void)? { get set }
    
    func start()
    func stop()
}
class AppCoordinator: Coordinator {

    var navigationController: UINavigationController
    var window: UIWindow!

    var didFinish: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.window.rootViewController = navigationController
        startFlow()
    }
    
    func startFlow() {
        let startViewController = StartViewController() // ты же вынес SubscribeViewController в createSubscribeController, так чего ты это тут все оставил, а не создал отдельный метод createStartViewController ?
        self.navigationController.pushViewController(startViewController, animated: true)
        
        startViewController.didTapNext = { [weak self] in
            guard let self = self else { return }
            let subscribeController = self.createSubscribeController()
            subscribeController.modalPresentationStyle = .overFullScreen // а почему ты это описываешь тут, а не в createSubscribeController ?
            subscribeController.modalTransitionStyle = .coverVertical
            DispatchQueue.main.async { // а остальной код у тебя не на мейне вызывается, что ты тут явно на мейн переходишь?
                self.navigationController.present(subscribeController, animated: true)
            }
        }
    }
    
    func stop() {
        didFinish?()
    }
}

extension AppCoordinator {
    private func createSubscribeController() -> UIViewController {
        let viewModel = SubscribeViewModel()
        let controller = SubscribeViewController(viewModel: viewModel)
        
        controller.didTapClose = { 
            controller.dismiss(animated: true, completion: nil) // у тебя же есть navigationController. надо self.navigationController.dismiss(animated: true)
        }
        
        return controller
    }
}
