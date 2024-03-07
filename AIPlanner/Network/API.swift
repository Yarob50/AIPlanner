//
//  API.swift
//  QosoorApp
//
//  Created by Ammar AlTahhan on 28/06/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

enum URLs {
    static let ChatBotUrl = "https://api.trypopcorn.ai/chat"
}

class API {
    enum Language: String { case english = "en" , arabic = "ar" }
    
    static func headers() -> [String: String] {
        var headers: [String: String] = [
            "Content-Type": "application/json",
            "POPCORN-API-KEY": Constants.chatPopCornKey,
        ]
        return headers
    }
    
    static func getMessageFromResponse(_ response: DataResponse<Any>) -> String {
        var message = ""
        switch response.result {
        case .failure(_):
            guard let data = response.data else { break }
            message = JSON(data)["message"].stringValue
            print(message)
        case .success(let value):
            message = JSON(value)["success_message"].stringValue
        }
        return message
    }
    
    static func isUnauthenticated(_ response: DataResponse<Any>) -> Bool {
        return response.response?.statusCode == 401
    }
}
