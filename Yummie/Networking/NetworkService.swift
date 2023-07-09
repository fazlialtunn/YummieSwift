//
//  NetworkService.swift
//  Yummie
//
//  Created by Fazlı Altun on 6.07.2023.
//

import Foundation


struct NetworkService {
    
    /// Generate URLRequest
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: request type
    ///   - parameters: extra info for backend
    /// - Returns: URLRequest
     func createRequest(route: Route,
                               method: Method,
                               parameters: [String:Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method{
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)")}
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params)
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
