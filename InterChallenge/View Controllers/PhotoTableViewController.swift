import UIKit

class PhotoTableViewController: UITableViewController, PhotoListViewModelOutput {
    weak var coordinator: MainCoordinator?
    
    func performSegue(index: Int, image: UIImage?) {
        let title = self.viewModel.titleForPhotoAt(index: index)
        guard let image = image else { return }
        self.coordinator?.photoToDetails(with: title, by: image)
    }
    
    
    func reloadCell(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        UIView.performWithoutAnimation {
            self.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }

    var albumId = Int()
    var userName = String()

    var viewModel: PhotoListViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = PhotoListViewModel()
        self.viewModel.output = self
        let backButton = UIBarButtonItem()
        backButton.title = localizedStrings.album.localized
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let titleString = localizedStrings.photosBy.localized
        navigationItem.title = titleString.appending(userName)
        self.tableView.rowHeight = 173
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        fillPhotos(from: albumId)
    }
    
    private func fillPhotos(from albumId: Int) {
        self.viewModel.loadPhotosBy(albumId: albumId)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCells(section: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoTableViewCell else {
            return UITableViewCell()
        }

        cell.titleLabel.text = self.viewModel.titleForPhotoAt(index: indexPath.row)
        cell.photoImageView.image = self.viewModel.thumbnailImageForPhotoCellAt(index: indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = self.viewModel.imageForPhotoCellAt(index: indexPath.row)
    }
}
