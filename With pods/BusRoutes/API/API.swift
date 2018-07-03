//
//  API.swift
//  PageViewContent
//
//  Created by Luis Henrique Borges on 30/06/2018.
//  Copyright © 2018 Luis Henrique Borges. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

protocol APIServiceProtocol {
    func fetchBusRoutes(completion: @escaping (_ routes: [BusRoute]?) -> Void)
}

struct APIMocky: APIServiceProtocol {
    private let url = URL(string: "http://www.mocky.io/v2/5a0b474a3200004e08e963e5")
    
    func fetchBusRoutes(completion: @escaping (_ routes: [BusRoute]?) -> Void) {
        URLSession.shared.dataTask(with: url!) {(data, _, error ) in
            guard let content = data, error == nil else {
                print("Error:", error as Any)
                print("Data:", data as Any)
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content,
                                                                options: .mutableContainers)) as? [JSON] else {
                                                                    print("Does not contain an array of JSON objects")
                                                                    return
            }
            
            let decoder = JSONDecoder()
            let routes = json.compactMap { routeJSON -> BusRoute? in
                if let data = try? JSONSerialization.data(withJSONObject: routeJSON,
                                                          options: .prettyPrinted) {
                    return try? decoder.decode(BusRoute.self, from: data)
                }
                return nil
            }
            
            completion(routes)
            }.resume()
    }
}
