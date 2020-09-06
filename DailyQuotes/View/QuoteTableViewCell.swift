//
//  QuoteTableViewCell.swift
//  DailyQuotes
//
//  Created by Vishweshwaran on 06/09/20.
//  Copyright © 2020 Dynamic Dudes. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    @IBOutlet var quotesText : UILabel!
    @IBOutlet var quotesAuthor : UILabel!

    static let identifier : String = "QuoteTableViewCell"
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func uiNib() -> UINib{
           return UINib(nibName: "QuoteTableViewCell", bundle: nil)
       }

    
}
