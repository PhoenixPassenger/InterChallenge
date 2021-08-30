import Alamofire
import UIKit

class CommentTableViewController: UITableViewController, ListViewModelOutput {
    
    var postId = Int()
    var userName = String()

    var viewModel: CommentListViewModelType!
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CommentListViewModel()
        self.viewModel.output = self
        let backButton = UIBarButtonItem()
        backButton.title = localizedStrings.posts.localized
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let titleString = localizedStrings.commentsBy.localized
        navigationItem.title = titleString.appending(userName)
        tableView.register(TitleAndDescriptionTableViewCell.self,
                           forCellReuseIdentifier: "TitleAndDescriptionCell")
        fillComments(from: postId)
    }
    
    private func fillComments(from postId: Int) {
        self.viewModel.loadCommentsBy(postId: postId)
   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCells(section: section)
   }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
            return UITableViewCell()
        }

        let index = indexPath.row
        cell.selectionStyle = .none
        cell.titleLabel.text = self.viewModel.nameForCommentAt(index: index)
        cell.descriptionLabel.text = self.viewModel.bodyForCommentAt(index: index)

        return cell
    }
}
