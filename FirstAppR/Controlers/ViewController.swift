//
//  ViewController.swift
//  FirstAppR
//
//  Created by Joao Bonilha on 24/01/21.
//

import UIKit
class ViewController: UIViewController {
    
    var tableViewController: RefeicoesTableViewController?
    
    @IBOutlet weak var NomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        
//        if let nomeDaRefeicao = NomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text{
//            let nome = nomeDaRefeicao
//            if let felicidade: Int = Int(felicidadeDaRefeicao){
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//                print("Comi \(nome) e fiqeui com felicidade: \(felicidade)")
//            } else {
//                print("erro ao tentar criar a refeicao")
//            }
//
//        }
        
        guard let nomeDaRefeicao = NomeTextField?.text else{
            return
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        
        tableViewController?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
}

