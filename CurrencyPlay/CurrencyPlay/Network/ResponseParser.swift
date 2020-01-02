//
//  ResponseParser.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 02.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation
import Moya

class ResponseParser {
    
    static func parse(response: Response,
                      urlPath: String,
                      callback: @escaping ([[String: AnyObject]]) -> Void,
                      failure: @escaping (MoyaError) -> Void) {
        let status = ResponseStatus(response)
        if status.isOk {
            do {
                let json = try response.mapJSON() as? [[String: AnyObject]]
                
                if let parsedResponse = json {
                    callback(parsedResponse)
                }
                else {
                    failure(MoyaError.jsonMapping(response))
                }
            }
            catch {
                print("Response for: \(urlPath) parsing error")
                failure(MoyaError.jsonMapping(response))
            }
        }
        else {
            print("Response for: \(urlPath) failed with status: \(status.statusCode)")
            failure(MoyaError.jsonMapping(response))
        }
    }
    
    private struct ResponseStatus {
        
        private enum StatusCodes: Int {
            case ok = 200
        }
        
        var statusCode: Int
        var isOk: Bool
        
        init(_ response: Response) {
            statusCode = response.statusCode
            isOk = response.statusCode == StatusCodes.ok.rawValue
        }
        
    }
    
}
