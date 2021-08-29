//
//  FailureAlert.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
import UIKit
extension UIViewController {
    func failureAlert(){
        let alert = UIAlertController(title: "Erro", message: "Algo errado aconteceu. Tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
