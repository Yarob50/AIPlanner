//
//  Completion.swift
//  TeamPlusApp
//
//  Created by Ammar AlTahhan on 25/01/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation

extension API {
    typealias ErrorMessage = String
    typealias BasicCompletion = (_ message: String, _ err: Error?)->Void
    typealias RegisterOrLoginCompletion = (_ message: String, _ registered: Bool, _ err: Error?)->Void
}

extension String {
    static var defaultErrorMessage: String {
        return "Sorry, couldn't complete your request."
    }
}
