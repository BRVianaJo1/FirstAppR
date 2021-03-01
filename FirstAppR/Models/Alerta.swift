//
//  Alerta.swift
//  FirstAppR
//
//  Created by Joao Bonilha on 28/02/21.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    func exibe(title: String = "Atenção", mensagem: String) {
        let alerta = UIAlertController(title: title, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
