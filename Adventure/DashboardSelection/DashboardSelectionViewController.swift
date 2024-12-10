//
//  DashboardSelectionViewController.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 03.11.2024.
//

import UIKit
import SwiftAlertView

class DashboardSelectionViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var task: TasksStorage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        doneButton.layer.cornerRadius = 10
        
        if let task = task {
            dayLabel.text = task.day
            taskLabel.text = task.task
            if let image = task.image {
                backgroundImageView.image = UIImage(named: image)
            }
            
            if let savedButtonText = TaskService.shared.buttonTexts[task.day] {
                doneButton.setTitle(savedButtonText, for: .normal)
            } else {
                doneButton.setTitle("Mark as Done", for: .normal)
            }
        }
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
        dismissButton.setImage(UIImage(systemName: "xmark", withConfiguration: largeConfig), for: .normal)
    }
    
    @IBAction func didTapDismissButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didTapDoneButton(_ sender: UIButton) {
        guard let task = task else { return }
        
        if TaskService.shared.completedTasks.contains(where: { $0.day == task.day }) {
            doneButton.setTitle("You already completed this quest", for: .normal)
            return
        }
        
        doneButton.setTitle("You already completed this quest", for: .normal)
        TaskService.shared.completedTasks.append(task)
        
        TaskService.shared.buttonTexts[task.day] = "You already completed this quest"
        
        let alert = SwiftAlertView(title: "Done", message: "Adventure quest completed!", buttonTitles: ["Continue the adventure"])
        alert.buttonHeight = 50
        alert.buttonTitleColor = .white
        alert.messageLabel.textColor = .white
        alert.titleLabel.textColor = .white
        alert.messageLabel.font = .systemFont(ofSize: 16)
        alert.backgroundColor = UIColor(red: 0.7, green: 0, blue: 0, alpha: 0.8)
        alert.show()
        
        alert.onButtonClicked { [weak self] alertView, buttonIndex in
            self?.dismiss(animated: true)
        }
    }
}
