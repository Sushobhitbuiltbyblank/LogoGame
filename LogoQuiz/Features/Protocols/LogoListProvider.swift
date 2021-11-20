//
//  LogoListProvider.swift
//  LogoQuiz
//
//  Created by Sushobhit.Jain on 20/11/21.
//

import Foundation


protocol LogoListProvider {
    func getList(onComplete:@escaping ([LogoModel]) -> Void)
}


