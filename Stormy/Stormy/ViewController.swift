//
//  ViewController.swift
//  Stormy
//
//  Created by Майя Калицева on 08.09.2022.
//

import UIKit

final class ViewController: UITableViewController {
    
    // MARK: - Private Properties
    
    private var pictures = [String]()
    
    // MARK: - Life-Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        configureFileManager()
    }
    
    // MARK: - Private Methods
    
    private func configureNavigationController() {
        title = "Storm pictures"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureFileManager() {
        let fileManager = FileManager.default //  This is a data type that lets us work with the filesystem
        let path = Bundle.main.resourcePath! // A directory containing our compiled program and all our assets
        do {
            let items = try? fileManager.contentsOfDirectory(atPath: path) // An array of strings containing filenames.
            guard let items = items else { return }
            for item in items {
                if item.hasPrefix("nssl") {
                    pictures.append(item)
                }
            }
        }
    }

    // MARK: - Configure tableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailsViewController {
            viewController.selectedImage = pictures[indexPath.row] // DetailsViewController gives us an image
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

