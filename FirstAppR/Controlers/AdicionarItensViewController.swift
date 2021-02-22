//
//  AdicionarItensViewController.swift
//  FirstAppR
//
//  Created by Joao Bonilha on 17/02/21.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
 
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    //MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //MARK: - View life civle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
    //navegar para a próxima tela navigationControler.puch()
        //navegar para tema anterior navigationControler().pop
        
        guard let nomeItem = nomeTextField.text, let calorias = caloriasTextField.text else {
            return
        }
        
        if let numeroDeCalorias = Double(calorias) {
            let item = Item(nome: nomeItem, calorias: numeroDeCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
}
