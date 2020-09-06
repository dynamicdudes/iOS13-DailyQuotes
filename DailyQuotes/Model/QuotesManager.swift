//
//  QuotesManager.swift
//  DailyQuotes
//
//  Created by Vishweshwaran on 06/09/20.
//  Copyright © 2020 Dynamic Dudes. All rights reserved.
//

import Foundation


struct QuotesManager {
    
  
    
    func fetchAllQuotes(onCompletion : @escaping ([QuoteModel]) -> Void){
        
        
        let mainUrl = Contants.API_URL
        
        guard let url = URL(string: mainUrl) else {
            return
            
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
        
                return
            }
            
            
            guard let safeData = data else{

                return
            }
            
            let decoder = JSONDecoder()
            
            guard let decodedData = try? decoder.decode([QuoteModel].self, from: safeData) else{
    
                return
            }
            
            onCompletion(decodedData)
           

        }.resume()
        
    }
    
    
    
    
    
  
        
    
}
