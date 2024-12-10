//
//  CompletedViewController.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 04.11.2024.
//

import UIKit

class CompletedViewController: UIViewController {
    
    @IBOutlet
    weak var collectionView: UICollectionView!
    
    var completedTask: TasksStorage?
    
    @IBOutlet
    weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .default)
        backButton.setImage(UIImage(systemName: "xmark", withConfiguration: largeConfig), for: .normal)
    }
    
    @IBAction
    func didTapBackButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: CompletedViewController.self))
        self.dismiss(animated: true)
    }
    
}
