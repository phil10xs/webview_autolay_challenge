//
//  ViewController.swift
//  webViewAutoChallenge
//
//  Created by APPLE on 7/16/23.
//

import UIKit

class ViewController: UITableViewController {
   var shoppingList = [String]()
    override func viewDidLoad() {
   
        
        super.viewDidLoad()
        
        title = "Web-AutoLayout Challenge"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharing))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if shoppingList.isEmpty{
            shoppingList = ["Gucci Bag"]
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    func submit (_ answer: String) {
        shoppingList.insert(answer, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        refreshTableView ()
        return
       
    }
    
    
    @objc func sharing() {
        let list = shoppingList.joined(separator: "\n")
        let vc = UIActivityViewController(activityItems: ["Hey!,I am gonna buy \(list). Stay Safer this Summer."], applicationActivities: [])
              vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
              present(vc, animated: true)
    }
    
    
    @objc func refreshTableView () {
        tableView.reloadData()
    }
    
    
    @objc func promptForAnswer () {
        let ac = UIAlertController(title: "Enter Shopping Item", message: nil, preferredStyle: .alert)
            ac.addTextField()

            let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
                guard let answer = ac?.textFields?[0].text else { return }
                self?.submit(answer)
            }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }


}

