//
//  RefeicoesTableViewController.swift
//  FirstAppR
//
//  Created by Joao Bonilha on 13/02/21.
//

import UIKit

 class RefeicoesTableViewController: UITableViewController {
    
    let refeicoes = [Refeicao(nome: "Macarrao", felicidade: 5),
                     Refeicao(nome: "Churros", felicidade: 4),
                     Refeicao(nome: "Japa", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
}
