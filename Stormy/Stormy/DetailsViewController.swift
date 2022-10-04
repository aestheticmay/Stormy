//
//  DetailsViewController.swift
//  Stormy
//
//  Created by Майя Калицева on 08.09.2022.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Public Properties
    
    @IBOutlet var stormyImageView: UIImageView!
    var selectedImage: String?
    
    // MARK: - Life-Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        loadingImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // MARK: - Private Properties
    
    private func configureNavigationController() {
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    private func loadingImage() {
        if let imageToLoad = selectedImage {
            stormyImageView.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareTapped() {
        guard let image = stormyImageView.image?.jpegData(compressionQuality: 0.8) else { return }
        let viewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // for IPads
        present(viewController, animated: true)
    }
}
