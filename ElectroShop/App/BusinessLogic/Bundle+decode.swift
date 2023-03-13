//
//  Bundle+decode.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 08.03.2023.
//

import SwiftUI

extension Bundle {
    func decodeData() -> [Product] {
        guard let url = self.url(forResource: "example.json",
                                 withExtension: nil) else {
            fatalError("URL ERROR")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        
        let decoder = JSONDecoder()
        
        guard let result = try? decoder.decode(ProductModel.self, from: data).products else {
            fatalError()
        }
        
        print(result)
        
        return result
    }
    
    func imageLoader(url: String) -> UIImage {
//        var session: URLSession = {
//            let config = URLSessionConfiguration.default
//            let session = URLSession(configuration: config)
//
//            return session
//        }()
        
        guard let url = URL(string: url) else {
            fatalError("Fail to create url from \(url)")
        }
        
//        let request = URLRequest(url: url)
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        
        guard let image = UIImage(data: data) else {
            fatalError()
        }
        
        return image
        
//        session.dataTask(with: request) { data, _, _ in
//            guard let data = try? Data(contentsOf: url) else {
//                fatalError()
//            }
//
//            guard let image: UIImage = UIImage(data: data) else {
//                fatalError()
//            }
    }
}
