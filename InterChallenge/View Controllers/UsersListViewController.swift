import Alamofire
import UIKit

class UsersListViewController: UITableViewController, ListViewModelOutput {
    
    var viewModel: ChallengeViewModelType!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ChallengeViewModel()
        self.viewModel.output = self
        tableView.rowHeight = 233
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        fillUsers()
    }
    
    private func fillUsers() {
        self.viewModel.loadUsers()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCells(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        cell.selectionStyle = .none
        cell.id = self.viewModel.idForUserAt(index: index)
        cell.initialsLabel.text = self.viewModel.initialForUserAt(index: index)
        cell.nameLabel.text = self.viewModel.nameForUserAt(index: index)
        cell.userNameLabel.text = self.viewModel.usernameForUserAt(index: index)
        cell.emailLabel.text = self.viewModel.emailForUserAt(index: index)
        cell.phoneLabel.text = self.viewModel.phoneForUserAt(index: index)
        cell.delegate = self
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .white : UIColor(white: 0.667, alpha: 0.2)
        return cell
    }
}

extension UsersListViewController: UserTableViewCellDelegate {
    func didTapAlbums(with userId: Int, by name: String) {
        let dest = AlbumTableViewController()
        dest.userId = userId
        dest.userName = name
        self.navigationController?.pushViewController(dest, animated: true)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        let dest = PostTableViewController()
        dest.userId = userId
        dest.userName = name
        self.navigationController?.pushViewController(dest, animated: true)
    }
}
