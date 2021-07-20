//
//  NoAppointmentRequiredViewController.swift
//  RayPets
//
//  Created by  60117280 on 2021/07/19.
//

import UIKit

protocol NoAppointmentRequiredViewContorllerDelegate: class {
    func noAppointMentViewControllerDidPressOkay(_ controller: NoAppointmentRequiredViewController)
}

class NoAppointmentRequiredViewController: UIViewController {
    
    @IBAction func okayButtonClicked(_ sender: Any) {
        coordinatorDelegate?.noAppointMentViewControllerDidPressOkay(self)
    }
    
    weak var coordinatorDelegate: NoAppointmentRequiredViewContorllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title  = "Just Stop By!"

    }
    
    init(delegate: PetAppointmentBuilderCoordinator) {
        self.coordinatorDelegate = delegate
        
        super.init(nibName: "NoAppointmentRequiredViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
