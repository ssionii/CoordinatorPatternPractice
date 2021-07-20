//
//  FakingItViewController.swift
//  RayPets
//
//  Created by  60117280 on 2021/07/19.
//

import UIKit

protocol FakingItViewControllerDelegate {
    func fakingItViewControllerPressedIsFake(_ controller: FakingItViewController)
    func fakingItViewControllerPressedNotFake(_ controller: FakingItViewController)
}

class FakingItViewController: UIViewController {

    @IBAction func yesButtonClicked(_ sender: Any) {
        coordinatorDelegate?.fakingItViewControllerPressedNotFake(self)
    }
    
    @IBAction func fakingButtonClicked(_ sender: Any) {
        coordinatorDelegate?.fakingItViewControllerPressedIsFake(self)
    }
    
    var coordinatorDelegate: FakingItViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title  = "Are you sure?"
    }
    
    init(delegate: PetAppointmentBuilderCoordinator) {
        self.coordinatorDelegate = delegate
        
        super.init(nibName: "FakingItViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
