//
//  LaunchViewController.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 05.11.2024.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        let animationView = LottieAnimationView(name: "launch")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .playOnce
        
        view.addSubview(animationView)
        
        animationView.play { [weak self] finished in
            self?.showMainScreen()
        }
    }
    
    private func showMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: String(describing: DashboardViewController.self))
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}
