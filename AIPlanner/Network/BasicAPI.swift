//
//  BasicAPI.swift
//  QosoorApp
//
//  Created by Ammar AlTahhan on 01/06/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension API {
    enum VenuesRequestType {
        case all, featured, offered, discounted
    }
    
    static func chatBot(senderMessage: String = "",
                          completion: @escaping (_ botMessage: Chat?,_ message: String, _ error: Error?)-> Void)
    {
        let url = URL(string: URLs.ChatBotUrl)!
        let headers  = API.headers()
        let parameters: [String: Any] = ["userId" : Constants.userID ,"message":senderMessage]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
    
            let message = getMessageFromResponse(response)
            switch response.result {
            case .failure(let err):
                completion(nil,message, err)
                
            case .success(let value):
                let json = JSON(value)
                do {
                    let messages: Chat = try JSONDecoder()
                        .decode(Chat.self, from: try json.rawData())
                    completion(messages, message, nil)
                } catch {
                    print("Error, couldn't decode data: \(error)")
                    completion(nil, "Error, couldn't decode data", error)
                }
            }
        }
    }
}
