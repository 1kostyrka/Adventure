//
//  DashboardSelectionViewController.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 03.11.2024.
//

import UIKit

class DashboardSelectionViewController: UIViewController {
    
    @IBOutlet
    weak var dayLabel: UILabel!
    @IBOutlet
    weak var taskLabel: UILabel!
    
    @IBOutlet
    weak var backgroundImageView: UIImageView!
    
    @IBOutlet
    weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        doneButton.layer.cornerRadius = 10
    }
    
    @IBAction
    func didTapDoneButton(_ sender: UIButton) {
    }
    
}
