//
//  ViewController.swift
//  FirstAppR
//
//  Created by Joao Bonilha on 24/01/21.
//

import UIKit
class ViewController: UIViewController {
    
   
    @IBOutlet weak var NomeTextField: UITextField!
    @IBOutlet var felicidadeTextField:
        UITextField!
    @IBAction func adicionar(_ sender: Any) {
        let nome = NomeTextField.text
        let felicidade = felicidadeTextField.text
        
        print("Comi \(nome) e fiqeui com felicidade: \(felicidade)")
    }
}

