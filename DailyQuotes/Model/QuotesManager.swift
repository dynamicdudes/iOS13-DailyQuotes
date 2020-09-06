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
        performRequest(with: mainUrl)
    }
    
    
    func performRequest(with urlString : String){
        
        guard let url = URL(string: urlString) else {
            return
            
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            guard let safeData = data else{
                return
            }
           
            self.decodeJson(with: safeData)

        }.resume()
    }
    
    func decodeJson(with mainData : Data){
        
        let decoder = JSONDecoder()
        guard let decodingData = try? decoder.decode([QuoteModel].self, from: mainData) else{
            return
        }
        
        
    }
  
        
    
}
