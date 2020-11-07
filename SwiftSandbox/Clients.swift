//
//  Clients.swift
//  SwiftSandbox
//
//  Created by Justin Adkins on 11/6/20.
//

import Foundation
import Alamofire

struct SystemCode {
    var name:String
    var code:String
}

class BaseClient {
    let API_BASE_URL:String
    var DEFAULT_HEADERS:HTTPHeaders
    
    init() {
        self.DEFAULT_HEADERS = [
            .accept("application/json"),
            .init(name: "X-HUBBLE", value: "iOS")
        ]
        //TODO: Only add auth if the user is actually logged in
        if (true) {
            DEFAULT_HEADERS.add(HTTPHeader.init(name: "", value: ""))
        }
        
        #if DEBUG
            self.API_BASE_URL = "https://hubble.mythcoders.dev/"
        #else
            self.API_BASE_URL = "https://hubble.vote/"
        #endif
    }
    
    func apiUrl(_ urlEnd:String) -> String {
        return "\(API_BASE_URL)/\(urlEnd)"
    }
}

class SystemCodesClient: BaseClient {
    func politicalParties() -> [String] {
        AF.request(apiUrl("system_codes/political_parties.json"), method: .get, headers: DEFAULT_HEADERS)            
            .responseJSON { response in
                print("Response: \(response)")
            }
        
        return Array.init(repeating: "d", count: 2)
    }
}
