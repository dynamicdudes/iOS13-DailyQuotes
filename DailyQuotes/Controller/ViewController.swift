//
//  ViewController.swift
//  DailyQuotes
//
//  Created by Vishweshwaran on 06/09/20.
//  Copyright © 2020 Dynamic Dudes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    
    var quotesManager = QuotesManager()
    var quotesText : [QuoteModel]  = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(QuoteTableViewCell.uiNib(), forCellReuseIdentifier: QuoteTableViewCell.identifier)
        
        
        let aFunction = { (fetchedData : [QuoteModel]) in
            
            DispatchQueue.main.async {
                self.quotesText = fetchedData
                self.tableView.reloadData()
            }

        }

        quotesManager.fetchAllQuotes(onCompletion: aFunction)

    }

}

extension ViewController : UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}


extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotesText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteTableViewCell",for: indexPath) as! QuoteTableViewCell
        
        let qText = quotesText[indexPath.row].text
        let aText = quotesText[indexPath.row].author
        
        cell.quotesText.text = qText
        cell.quotesAuthor.text = "- \(aText ?? "Yourself")"
        
        
        return cell
    }
    
    
}
