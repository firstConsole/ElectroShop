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
    
    func imageLoader(url: String) -> UIImage? {
        
        var image: UIImage?
        
        guard let url = URL(string: url) else {
            fatalError()
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let imageData = try? Data(contentsOf: url) else {
                return
            }
            
            let loadedImage = UIImage(data: imageData)
            
            image = loadedImage
        }
        
        return image
    }
}
