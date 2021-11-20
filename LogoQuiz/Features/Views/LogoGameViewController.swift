//
//  ViewController.swift
//  LogoQuiz
//
//  Created by Sushobhit.Jain on 20/11/21.
//

import UIKit

class LogoGameViewController: UIViewController {

    @IBOutlet weak var logoImageView: CachableImageView!
    @IBOutlet weak var selectedCharSTV: UIStackView!
    @IBOutlet weak var charListCollectionV: UICollectionView!
    
    var viewModel:LogoGameViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
    }
    
    func setupData() {
        // initialize ViewModel
        self.viewModel = LogoGameVM()
        guard let logoObj = self.viewModel?.getCurrentLogoElement() else {
            return
        }
        if let url = URL(string: logoObj.imgUrl) {
            self.logoImageView.downloadImageFrom(url: url,imageMode: .scaleAspectFit)
        }
        self.initializeSelectedChar()
        self.initializeCharList()
    }
    
    func initializeSelectedChar() {
        guard let logoObj = self.viewModel?.getCurrentLogoElement() else {
            return
        }
        let charCount = logoObj.name.count
        for _ in 0..<charCount {
            let label = UILabel()
            label.text = " "
            label.textColor = UIColor.white
            label.backgroundColor = UIColor.gray
            self.selectedCharSTV.addArrangedSubview(label)
        }
    }
    
    func initializeCharList() {
        let arr = self.viewModel?.getOptionCharList()
        print(arr)
    }
    
}

