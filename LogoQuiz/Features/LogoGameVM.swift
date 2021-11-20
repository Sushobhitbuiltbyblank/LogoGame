//
//  LogoGameVM.swift
//  LogoQuiz
//
//  Created by Sushobhit.Jain on 20/11/21.
//

import Foundation


class LogoGameVM:LogoGameViewModel {
    private var logoList: [LogoModel] = []
    private var currentStep:Int = 0
    
    init() {
        let dataProvider = LocalLogoDataProvider()
        self.fetchData(provider: dataProvider)
    }
    
    func fetchData(provider:LogoListProvider) {
        provider.getList { list in
            self.logoList = list
        }
    }
    
    func getTotalStep()-> Int {
        return logoList.count
    }
    
    func getCurrentLogoElement() -> LogoModel {
        return logoList[currentStep]
    }
    
    func increaseCurrentCount() {
        self.currentStep += 1
    }
    
    func decreaseCurrentCount() {
        self.currentStep -= 1
    }
    
    func getOptionCharList()-> [String] {
        let name = self.logoList[currentStep].name
        var result = [String](repeating: "", count: 12)
        for i in 0..<12 {
            let index = Int.random(in: 0..<12)
            if name.count > i {
                result.insert(String(name[name.index(name.startIndex, offsetBy: i)]), at: index)
            } else {
                result.insert(randomString(length:1), at: i)
            }
        }
        return result
    }
    
    func randomString(length: Int) -> String {
      let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }

    
    
}


