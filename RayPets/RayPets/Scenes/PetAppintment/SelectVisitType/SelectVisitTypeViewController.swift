//
//  SelectVisitTypeViewController.swift
//  RayPets
//
//  Created by  60117280 on 2021/07/19.
//

import UIKit

protocol SelectVisitTypeControllerDelegate: class {
    func selectVisitTypeViewController(_ controller: SelectVisitTypeViewController, didSelect visitType: VisitType)
}

enum VisitType {
    case well
    case sick
}

class SelectVisitTypeViewController: UIViewController {

    @IBAction func wellVisitButtonClicked(_ sender: Any) {
        coordinatorDelegate?.selectVisitTypeViewController(self, didSelect: .well)
    }
    
    
    @IBAction func sickVisitButtonClicked(_ sender: Any) {
        coordinatorDelegate?.selectVisitTypeViewController(self, didSelect: .sick)
    }
    
    
    weak var coordinatorDelegate: SelectVisitTypeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Visit Type?"
    }
    
    init(delegate: SelectVisitTypeControllerDelegate) {
        self.coordinatorDelegate = delegate
        
        super.init(nibName: "SelectVisitTypeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
