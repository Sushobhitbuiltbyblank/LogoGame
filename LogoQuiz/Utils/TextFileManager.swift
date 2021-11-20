//
//  TextFileManager.swift
//  LogoQuiz
//
//  Created by Sushobhit.Jain on 20/11/21.
//

import Foundation

struct TextFileManager {
    
    func getText(from filePath:String,onComplete:(String)->Void) {
        let path = Bundle.main.path(forResource: filePath, ofType: "txt") // file path for file "data.txt"
        do {
            let string = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            onComplete(string)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
