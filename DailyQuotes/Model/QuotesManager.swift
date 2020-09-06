//
//  QuotesManager.swift
//  DailyQuotes
//
//  Created by Vishweshwaran on 06/09/20.
//  Copyright © 2020 Dynamic Dudes. All rights reserved.
//

import Foundation


struct QuotesManager {
    
  
    
    func fetchAllQuotes(){
        let mainUrl = Contants.API_URL
        performRequest(with: mainUrl) { (quotes) in
            if let quotesData = quotes {
                for quotes in quotesData{
                    print(quotes.text)
                }
            }
        }
    }
    
    
    func performRequest(with urlString : String,completion: @escaping ([QuoteModel]?) -> Void){
        
        guard let url = URL(string: urlString) else {
            return
            
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            
            guard let safeData = data else{
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let decodedData = try? decoder.decode([QuoteModel].self, from: safeData) else{
                completion(nil)
                return
            }
            
            completion(decodedData)
           

        }.resume()
    }
    
    
  
        
    
}
