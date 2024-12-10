//
//  DashboardViewController.swift
//  Adventure
//
//  Created by Ivan Kostyrka on 01.11.2024.
//
import UIKit
import FLAnimatedImage

class DashboardViewController: UIViewController {
    
    @IBOutlet
    weak var collectionView: UICollectionView!
    
    @IBOutlet
    weak var questsButton: UIButton!
    
    var days = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25"]
    
    let animatedBackground = FLAnimatedImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupAnimatedBackground()
    }
    
    private func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        questsButton.layer.cornerRadius = 10
    }
    
    @IBAction
    func didTapQuestsButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: CompletedViewController.self))
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    
    private func setupAnimatedBackground() {
        // Налаштування FLAnimatedImageView
        animatedBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedBackground)
        
        // Додаємо обмеження для заповнення екрана
        NSLayoutConstraint.activate([
            animatedBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animatedBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animatedBackground.topAnchor.constraint(equalTo: view.topAnchor),
            animatedBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Завантаження GIF-файлу
        if let path = Bundle.main.path(forResource: "snow", ofType: "gif") {
            let url = URL(fileURLWithPath: path)
            animatedBackground.animatedImage = FLAnimatedImage(animatedGIFData: try! Data(contentsOf: url))
        }
    }
}
