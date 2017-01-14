//
//  RequestsAnswers.swift
//  SwiftStack
//
//  Created by Felix Deil on 14.01.17.
//
//

import Foundation

/**
 This extension contains all requests in the QUESTIONS section of the StackExchange API Documentation.
 
 - author: NobodyNada, FelixSFD
 */
public extension APIClient {
    // - MARK: /answers
    /**
     Fetches all answers on the site synchronously.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an APIRequest has a backoff
     
     - returns: The list of questions as `APIResponse<Answer>`
     
     - author: FelixSFD
     */
    public func fetchAnswers(
        parameters: [String:String] = [:],
        backoffBehavior: BackoffBehavior = .wait) throws -> APIResponse<Answer> {
        
        return try performAPIRequest(
            "answer",
            parameters: parameters,
            backoffBehavior: backoffBehavior
        )
    }
    
    /**
     Fetches all answers on the site asynchronously.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an APIRequest has a backoff
     
     - parameter completion
     
     - author: FelixSFD
     */
    public func fetchAnswers(
        parameters: [String: String] = [:],
        backoffBehavior: BackoffBehavior = .wait,
        completionHandler: @escaping (APIResponse<Answer>?, Error?) -> ()) {
        
        queue.async {
            do {
                let response: APIResponse<Answer> = try self.fetchAnswers(
                    parameters: parameters,
                    backoffBehavior: backoffBehavior
                )
                
                completionHandler(response, nil)
            } catch {
                completionHandler(nil, error)
            }
        }
    }
    
    
    // - MARK: /answers/{ids}
    /**
     Fetches answers synchronously.
     
     - parameter ids: The answer IDs to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an APIRequest has a backoff
     
     - returns: The list of sites as `APIResponse<Answer>`
     
     - author: NobodyNada
     */
    public func fetchAnswers(
        _ ids: [Int],
        parameters: [String:String] = [:],
        backoffBehavior: BackoffBehavior = .wait) throws -> APIResponse<Answer> {
        
        guard !ids.isEmpty else {
            fatalError("ids is empty")
        }
        
        
        return try performAPIRequest(
            "answers/\(ids.map {String($0)}.joined(separator: ";"))",
            parameters: parameters,
            backoffBehavior: backoffBehavior
        )
    }
    
    /**
     Fetches answers asynchronously.
     
     - parameter ids: The answer IDs to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an APIRequest has a backoff
     
     - parameter completion
     
     - author: NobodyNada
     */
    public func fetchAnswers(
        _ ids: [Int],
        parameters: [String: String] = [:],
        backoffBehavior: BackoffBehavior = .wait,
        completionHandler: @escaping (APIResponse<Answer>?, Error?) -> ()) {
        
        queue.async {
            do {
                let response: APIResponse<Answer> = try self.fetchAnswers(
                    ids,
                    parameters: parameters,
                    backoffBehavior: backoffBehavior
                )
                
                completionHandler(response, nil)
            } catch {
                completionHandler(nil, error)
            }
        }
    }
    
    
    /**
     Fetches an answer synchronously.
     
     - parameter ids: The answer ID to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an APIRequest has a backoff
     
     - returns: The list of sites as `APIResponse<Answer>`
     
     - author: NobodyNada
     */
    public func fetchAnswer(
        _ id: Int,
        parameters: [String:String] = [:],
        backoffBehavior: BackoffBehavior = .wait) throws -> APIResponse<Answer> {
        
        return try fetchAnswers([id], parameters: parameters, backoffBehavior: backoffBehavior)
    }
    
    /**
     Fetches an answer asynchronously.
     
     - parameter ids: The answer IDs to fetch.
     
     - parameter parameters: The dictionary of parameters used in the request
     
     - parameter backoffBehavior: The behavior when an APIRequest has a backoff
     
     - parameter completion
     
     - author: NobodyNada
     */
    public func fetchAnswer(
        _ id: Int,
        parameters: [String: String] = [:],
        backoffBehavior: BackoffBehavior = .wait,
        completionHandler: @escaping (APIResponse<Answer>?, Error?) -> ()) {
        
        fetchAnswers([id], parameters: parameters, backoffBehavior: backoffBehavior, completionHandler: completionHandler)
    }
}