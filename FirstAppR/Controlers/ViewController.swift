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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
   
    //MARK: - IBOutlets
    
    @IBOutlet weak var itensTableView: UITableView?
    
    //MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item]  = [Item(nome: "Molho de tomate", calorias: 40.0),
                          Item(nome: "Queijo", calorias: 40.0),
                          Item(nome: "Molho apimentado", calorias: 40.0),
                          Item(nome: "Manjericao", calorias: 40.0)]
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var NomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    // MARK: - View life cycle
 
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(adicionarItem))
        
        navigationItem.rightBarButtonItem = botaoAdicionaItem

    }
    
   @objc func adicionarItem(){
    let adicionarItensViewController = AdicionarItensViewController(delegate: self)
    navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableView?.reloadData()
        if let tableView = itensTableView{
            tableView.reloadData()
        } else {
            let alerta = UIAlertController(title: "Desculpe", message: "Não foi possível atualizar a tabela", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alerta.addAction(ok)
            
            present(alerta, animated: true, completion: nil)
        }
    }
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        celula.textLabel?.text = item.nome
        
        return celula
    }
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhadaTabela = indexPath.row
            itensSelecionados.append(itens[linhadaTabela])
            
        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
                
            }
            
        }
        
       
    }
    
    //MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = NomeTextField?.text else{
            return
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
       
        
        print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade) !")
        
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
  }

