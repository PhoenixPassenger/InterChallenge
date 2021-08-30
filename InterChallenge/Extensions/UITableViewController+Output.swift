//
//  TableOutput.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import UIKit
extension ListViewModelOutput where Self:UITableViewController{
    func needToReload() {
        self.tableView.reloadData()
    }
    
    func needToShowFailureAlert() {
        self.failureAlert()
    }
    
}
