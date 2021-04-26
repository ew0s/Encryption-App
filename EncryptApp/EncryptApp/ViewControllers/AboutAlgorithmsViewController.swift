//
//  AboutAlgorithmsViewController.swift
//  EncryptApp
//
//  Created by Егор Савковский on 26.04.2021.
//

import UIKit

class AboutAlgorithmsViewController: UITableViewController {

    // MARK: - Private constants
    private let algorithms = Algorithm.getAlgorithms()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    // MARK: - IB Actions
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        algorithms.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(section)
        return algorithms[section].name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "algorithmInfoCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let algorithm = algorithms[indexPath.section]

    
        switch indexPath.row {
        case 0:
            content.text = "About algorithm"
            content.image = UIImage(named: "exclamationMark")
        default:
            content.text = algorithm.creator.fullName
            content.image =  UIImage(named: algorithm.creator.image)
            content.imageProperties.cornerRadius = tableView.rowHeight / 2
        }

        cell.contentConfiguration = content

        return cell
    }
}
