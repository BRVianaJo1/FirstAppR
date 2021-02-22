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
    var itens: Array<Item> = []
    
    // MARK: - Init
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    //MARK: - Metodos
    func totalDeCalorias() -> Double{
        var total = 0.0
        for TESTE in itens {
            total += TESTE.calorias
        }
        
        return total
    }
}
