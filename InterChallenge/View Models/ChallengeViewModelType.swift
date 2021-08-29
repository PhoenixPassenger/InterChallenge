//
//  ChallengeViewModelType.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
protocol ChallengeViewModelType {
    var output: ListViewModelOutput? { get set }
    func idForUserAt(index: Int) -> Int
    func nameForUserAt(index: Int) -> String
    func usernameForUserAt(index: Int) -> String
    func emailForUserAt(index: Int) -> String
    func phoneForUserAt(index: Int) -> String
    func initialForUserAt(index: Int) -> String
    func numberOfCells(section: Int) -> Int
    func loadUsers()
}

