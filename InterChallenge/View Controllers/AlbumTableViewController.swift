import Alamofire
import UIKit

class AlbumTableViewController: UITableViewController, ListViewModelOutput {

    var userId = Int()
    var userName = String()

    var viewModel: AlbumListViewModelType!
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = AlbumListViewModel()
        self.viewModel.output = self
        let backButton = UIBarButtonItem()
        backButton.title = localizedStrings.challenge.localized
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let titleString = localizedStrings.albumsBy.localized
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        navigationItem.title = titleString.appending(userName)
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        fillAlbums(from: userId)
    }
    
    private func fillAlbums(from userId: Int) {
        self.viewModel.loadAlbumsBy(userId: userId)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCells(section: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }

        cell.albumNameLabel.text = self.viewModel.titleForAlbumAt(index: indexPath.row)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumId = self.viewModel.idForAlbumAt(index: indexPath.row)
        self.coordinator?.albumToPhoto(with: albumId, by: self.userName)
    }
}
