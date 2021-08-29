import Alamofire
import UIKit

class PhotoTableViewController: UITableViewController, PhotoListViewModelOutput {
    func performSegue(index: Int, image: UIImage?) {
        let title = self.viewModel.titleForPhotoAt(index: index)
        let dest = DetailsViewController()
        dest.name = title
        guard let image = image else { return }
        dest.photo = image
        self.navigationController?.pushViewController(dest, animated: true)
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
        backButton.title = NSLocalizedString("Album", comment: "")
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let titleString = NSLocalizedString("PhotosBy", comment: "")
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
