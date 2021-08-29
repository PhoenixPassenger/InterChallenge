//
//  PhotosListViewModelOutput.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
import UIKit
protocol PhotoListViewModelOutput: ListViewModelOutput {
    func reloadCell(index: Int)
    func performSegue(index: Int, image: UIImage?)
}
