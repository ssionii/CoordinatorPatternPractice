//
//  HomeViewController.swift
//  RayPets
//
//  Created by  60117280 on 2021/07/19.
//

import UIKit

protocol HomeViewControllerDelegate {
    func homeViewControllerDidPressScheduleAppointment(_ viewController: HomeViewController)
}

class HomeViewController: UIViewController {
    
    @IBAction func scheduleVisitButtonClicked(_ sender: Any) {
        coordinatorDelegate?.homeViewControllerDidPressScheduleAppointment(self)
    }
    
    var coordinatorDelegate: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(delegate: HomeCoordinator) {
        self.coordinatorDelegate = delegate
        
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
