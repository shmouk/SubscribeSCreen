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
        let startViewController = createStartController()  
        self.navigationController.pushViewController(startViewController, animated: true)
    }
    
    func stop() {
        didFinish?()
    }
}

extension AppCoordinator {
    private func createStartController() -> UIViewController {
        let controller = StartViewController()
        
        controller.didTapNext = { [weak self] in
            guard let self = self else { return }
            
            let subscribeController = self.createSubscribeController()
            subscribeController.modalPresentationStyle = .overFullScreen // эти параметры должны быть установлены перед тем как контроллер будет представлен с помощью метода present()
            subscribeController.modalTransitionStyle = .coverVertical
            self.navigationController.present(subscribeController, animated: true)
        }
        
        return controller
    }
    
    private func createSubscribeController() -> UIViewController {
        let viewModel = SubscribeViewModel()
        let controller = SubscribeViewController(viewModel: viewModel)
        
        controller.didTapClose = { 
            self.navigationController.dismiss(animated: true)
        }
        
        return controller
    }
}
