//
//  Refeicao.swift
//  FirstAppR
//
//  Created by Joao Bonilha on 10/02/21.
//

import UIKit

class Refeicao: NSObject {
    // MARK: - Atributos
    let nome: String
    let felicidade: Int
    let items: Array<Item> = []
    
    // MARK: - Construtor
    
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    //MARK: - Metodos
    func totalDeCalorias() -> Double{
        var total = 0.0
        for TESTE in items {
            total += TESTE.calorias
        }
        
        return total
    }
}
