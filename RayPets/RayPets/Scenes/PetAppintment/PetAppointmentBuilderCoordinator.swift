//
//  PetAppointmentBuilderCoordinator.swift
//  RayPets
//
//  Created by  60117280 on 2021/07/19.
//

import UIKit

public class PetAppointmentBuilderCoordinator: Coordinator, SelectVisitTypeControllerDelegate, SelectPainLevelViewControllerDelegate, FakingItViewControllerDelegate, NoAppointmentRequiredViewContorllerDelegate {
    
    public let builder = PetAppointmentBuilder()
    public var children: [Coordinator] = []
    public let router: Router
    
    public init(router: Router) {
        self.router = router
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = SelectVisitTypeViewController(delegate: self)
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
    
    
    // MARK: - SelectVisitTypeControllerDelegate
    func selectVisitTypeViewController(_ controller: SelectVisitTypeViewController, didSelect visitType: VisitType) {
        
        builder.visitType = visitType
        
        switch visitType {
        case .well:
            presentNoAppointmentViewController()
        case .sick:
            presentSelecPainLevelCoordinator()
        }
    }
    
    // MARK: - SelectPainLevelViewControllerDelegate
    func selectPainLevelViewController(_ controller: SelectPainLevelViewController, didSelect painLevel: PainLevel) {
        
        builder.painLevel = painLevel
        
        switch painLevel {
        case .none, .little :
            presentFakingitViewController()
        case .moderate, .severe, .worstPossible:
            presentNoAppointmentViewController()
        }
    }
    
    
    // MARK: - FakingItViewControllerDelegate
    func fakingItViewControllerPressedIsFake(_ controller: FakingItViewController) {
        router.dismiss(animated: true)
    }
    
    func fakingItViewControllerPressedNotFake(_ controller: FakingItViewController) {
        presentNoAppointmentViewController()
    }
    
    
    // MARK: - NoAppointmentRequiredViewContorllerDelegate
    func noAppointMentViewControllerDidPressOkay(_ controller: NoAppointmentRequiredViewController) {
        router.dismiss(animated: true)
    }
    
    
    
    // MARK: - Present ViewController
    private func presentNoAppointmentViewController() {
        let viewController = NoAppointmentRequiredViewController(delegate: self)
        router.present(viewController, animated: true)
    }
    
    private func presentSelecPainLevelCoordinator() {
        let viewController = SelectPainLevelViewController(delegate: self)
        router.present(viewController, animated: true)
    }
    
    private func presentFakingitViewController() {
        let viewController = FakingItViewController(delegate: self)
        router.present(viewController, animated: true)
    }
}
