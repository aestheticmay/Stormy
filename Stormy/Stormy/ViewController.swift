//
//  ViewController.swift
//  Stormy
//
//  Created by Майя Калицева on 08.09.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Public Properties
    
    var pictures = [String]()
    
    // MARK: - Life-Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFileManager()
    }
    
    // MARK: - Public Methods
    
    func configureFileManager() {
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
        print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

