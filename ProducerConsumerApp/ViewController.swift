//
//  ViewController.swift
//  ProducerConsumerApp
//
//  Created by Lauren Simon on 4/10/19.
//  Copyright © 2019 Lauren Simon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cells: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func producerPressed(_ sender: UIButton) {
        print("new cell!")
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { _ in
            self.cells.append("New cell!")
            self.tableView.reloadData()
        })
    }
    
    @IBAction func consumerPressed(_ sender: UIButton) {
        print("delete cell")
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { _ in
            if !self.cells.isEmpty {
                self.cells.removeLast()
                self.tableView.reloadData()
            }
        })
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cells[indexPath.row]
        return cell
    }
}

