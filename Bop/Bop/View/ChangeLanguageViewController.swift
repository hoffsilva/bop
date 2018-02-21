//
//  ChangeLanguageViewController.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 18/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import Hero

class ChangeLanguageViewController: UIViewController {
    
    @IBOutlet weak var languagesListPickerView: UIPickerView!
    
    let languagesListViewModel = LanguagesListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        languagesListViewModel.delegate = self
        languagesListPickerView.delegate = self
        languagesListPickerView.dataSource = self
        languagesListViewModel.loadLanguages()
    }
    
    @IBAction func giveUpChangeLanguage() {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "moviesList")
        Hero.shared.defaultAnimation = .zoomSlide(direction: HeroDefaultAnimationType.Direction.right)
        Hero.shared.animate()
        hero_replaceViewController(with: vc)
    }
    
    @IBAction func updateLanguage() {
        languagesListViewModel.setNewLanguage()
        giveUpChangeLanguage()
    }

}

extension ChangeLanguageViewController: LanguagesListDelegate {
    func didFinishLoading() {
        languagesListPickerView.reloadAllComponents()
    }
    
    func didFailLoading(with errorMessage: String, code errorCode: Int?) {
        
    }
}

extension ChangeLanguageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesListViewModel.numberOfLanguages
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        languagesListViewModel.selectedLanguage = languagesListViewModel.arrayLanguages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesListViewModel.arrayLanguages[row]
    }
}
