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

// MARK: enum for method fetch

enum APIResult<T> {
    case Success(T)
    case Failure(Error)
}


// MARK: protocol JSONDecodable

protocol JSONDecodable {
    init?(JSON: [String: AnyObject])
}


// MARK: protocol FinalURLPoint

protocol FinalURLPoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
    
    
}


// MARK: protocol APIManager

protocol APIManager {
    
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping JSONCompletionHandler)  -> JSONTask
    func fetch<T: JSONDecodable>(request: URLRequest, parse: ([String: AnyObject]) -> T?, completionHandler: (APIResult<T>) -> Void)
    
    init(sessionConfiguration: URLSessionConfiguration)
    
}


// MARK: extension APIManger
// logic for methods in APIManager protocol

extension APIManager {
    
    // MARK: method JSONTaskWith
    // get json
    
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping JSONCompletionHandler)  -> JSONTask {
    
      let dataTask = session.dataTask(with: request) { (data, response, error) in
        guard let HTTPResponse = response as? HTTPURLResponse else {
          let userInfo = [ NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")]
          let error = NSError(domain: VGNetworkingErrorDomain, code: 100, userInfo: userInfo)
          completionHandler(nil, nil, error)
          return
        }
      
        if data == nil {
          if let error = error {
            completionHandler(nil, HTTPResponse, error)
          }
        } else {
          switch HTTPResponse.statusCode {
          case 200:
            do {
              let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
              completionHandler(json, HTTPResponse, nil)
            } catch let error as NSError {
              completionHandler(nil, HTTPResponse, error)
            }
          default:
            print("We have got response status \(HTTPResponse.statusCode)")
          }
        }
      }
      return dataTask
    }
    
    
    // MARK: method fetch<T>
    // read json
    
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void) {
        
        let dataTask = JSONTaskWith(request: request) { (json, response, error) in
            guard let json = json else {
                if let error = error {
                    completionHandler(.Failure(error))
                }
                return
            }
            if let value = parse(json) {
                completionHandler(.Success(value))
            } else {
                let error = NSError(domain: VGNetworkingErrorDomain, code: 200, userInfo: nil)
                completionHandler(.Failure(error))
            }
        }
        dataTask.resume()
    }
    
}


