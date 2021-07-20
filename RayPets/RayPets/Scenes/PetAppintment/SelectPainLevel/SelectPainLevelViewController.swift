//
//  SelectPainLevelViewController.swift
//  RayPets
//
//  Created by  60117280 on 2021/07/19.
//

import UIKit

protocol SelectPainLevelViewControllerDelegate {
    func selectPainLevelViewController(_ controller: SelectPainLevelViewController, didSelect painLevel: PainLevel)
}

enum PainLevel {
    case none
    case little
    case moderate
    case severe
    case worstPossible
}

class SelectPainLevelViewController: UIViewController {
    
    @IBAction func noneButtonClicked(_ sender: Any) {
        coordinatorDelegate?.selectPainLevelViewController(self, didSelect: .none)
    }
    
    @IBAction func littleButtonClicked(_ sender: Any) {
        coordinatorDelegate?.selectPainLevelViewController(self, didSelect: .little)
    }
    
    @IBAction func moderateButtonClicked(_ sender: Any) {
        coordinatorDelegate?.selectPainLevelViewController(self, didSelect: .moderate)
    }
    
    @IBAction func severeButtonClicked(_ sender: Any) {
        coordinatorDelegate?.selectPainLevelViewController(self, didSelect: .severe)
    }
    
    @IBAction func worstPossibleButtonClicked(_ sender: Any) {
        coordinatorDelegate?.selectPainLevelViewController(self, didSelect: .worstPossible)
    }
    
    
    var coordinatorDelegate: SelectPainLevelViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title  = "Any Pain?"

    }
    
    init(delegate: PetAppointmentBuilderCoordinator) {
        self.coordinatorDelegate = delegate
        
        super.init(nibName: "SelectPainLevelViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
