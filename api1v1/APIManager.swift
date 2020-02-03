//
//  APIManager.swift
//  api1v1
//
//  Created by Vadim  Gorbachev on 04.02.2020.
//  Copyright © 2020 Vadim  Gorbachev. All rights reserved.
//

import Foundation


typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void


enum APIResult<T> {
    case Success(T)
    case Failure(Error)
}


protocol APIManager {
    
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, completionHandler: JSONCompletionHandler)  -> JSONTask
    func fetch<T>(request: URLRequest, parse: ([String: AnyObject]) -> T?, completionHandler: (APIResult<T>) -> Void)
    
    init(sessionConfiguration: URLSessionConfiguration)
    
}
