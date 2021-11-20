//
//  LocalLogoDataProvider.swift
//  LogoQuiz
//
//  Created by Sushobhit.Jain on 20/11/21.
//

import Foundation

class LocalLogoDataProvider :LogoListProvider {
    
    func getList(onComplete: @escaping ([LogoModel]) -> Void) {
        TextFileManager().getText(from: "logo") { text in
            if let data = text.data(using: .utf8) {
                do {
                    let list = try JSONDecoder().decode([LogoModel].self, from: data)
                    onComplete(list)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
