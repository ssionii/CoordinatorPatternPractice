//
//  HomeCoordinator.swift
//  RayPets
//
//  Created by  60117280 on 2021/07/19.
//

import UIKit

public class HomeCoordinator: Coordinator, HomeViewControllerDelegate {
    
    public var children: [Coordinator] = []
    public let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = HomeViewController(delegate: self)
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
    
    
    // MARK: - HomeViewControllerDelegate
    func homeViewControllerDidPressScheduleAppointment(_ viewController: HomeViewController) {
        
        let router = ModalNavigationRouter(parentViewController: viewController)
        let coordinator = PetAppointmentBuilderCoordinator(router: router)
        presentChild(coordinator, animated: true)
    }
}
