//
//  LogoGameViewModel.swift
//  LogoQuiz
//
//  Created by Sushobhit.Jain on 20/11/21.
//

import Foundation

protocol LogoGameViewModel {
    func getCurrentLogoElement() -> LogoModel
    func getOptionCharList()-> [String]
}




