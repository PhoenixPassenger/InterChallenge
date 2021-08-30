import UIKit

class PostTableViewController: UITableViewController, ListViewModelOutput {
    
    var userId = Int()
    var userName = String()
    
    var viewModel: PostListViewModelType!
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = LocalizedStrings.challenge.localized
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let titleString = LocalizedStrings.postsBy.localized
        navigationItem.title = titleString.appending(userName)
        tableView.register(TitleAndDescriptionTableViewCell.self,
                           forCellReuseIdentifier: "TitleAndDescriptionCell")
        fillPosts(from: userId)
    }
    
    private func fillPosts(from userId: Int) {
        self.viewModel.loadPostsBy(userId: userId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfCells(section: section)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        cell.titleLabel.text = self.viewModel.titleForPostAt(index: index)
        cell.descriptionLabel.text = self.viewModel.bodyForPostAt(index: index)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postId = self.viewModel.idForPostAt(index: indexPath.row)
        self.coordinator?.postsToComments(with: postId, by: self.userName)
    }
}
