//
//  PostListViewModelOutput.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
protocol ListViewModelOutput: AnyObject {
    func needToReload()
    func needToShowFailureAlert()
}
