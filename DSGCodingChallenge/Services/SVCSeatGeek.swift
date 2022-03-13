//
//  SVCSeatGeek.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import Foundation
import Combine

final class SVCSeatGeek {
    private struct Constants {
        static let clientId = "MjYwNDg4NjJ8MTY0Njk1MTM3NS43NjM0Mzk0"
    }
    
    enum APIError: Error {
        case failedToGetData
        case badRequest
    }
    
    public func getEvents(eventName: String) -> Future<[DTOEvent], Error> {
        return Future { promise in
            //Required by API
            let eventName = eventName.replacingOccurrences(of: " ", with: "+")
            
            guard let requestUrl = URL(string: "https://api.seatgeek.com/2/events?client_id=\(Constants.clientId)&q=\(eventName)") else { promise(.failure(APIError.badRequest))
                return
            }
            
            let request = URLRequest(url: requestUrl)
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    promise(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(Events.self, from: data)
                    promise(.success(result.events))
                } catch {
                    promise(.failure(error))
                }
            }
            .resume()
        }
    }
}
