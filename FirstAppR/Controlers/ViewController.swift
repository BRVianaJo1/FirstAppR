//
//  ViewController.swift
//  FirstAppR
//
//  Created by Joao Bonilha on 24/01/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate{
    func add(_ refeicao: Refeicao)
} //Equivalente a interface em java.

class ViewController: UIViewController {
    
    var delegate: AdicionaRefeicaoDelegate?
    
    @IBOutlet weak var NomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = NomeTextField?.text else{
            return
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
}

