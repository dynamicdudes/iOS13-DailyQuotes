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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(QuoteTableViewCell.uiNib(), forCellReuseIdentifier: QuoteTableViewCell.identifier)
        quotesManager.fetchAllQuotes()

    }


}


extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteTableViewCell",for: indexPath) as! QuoteTableViewCell
        
        
        
        return cell
    }
    
    
}
