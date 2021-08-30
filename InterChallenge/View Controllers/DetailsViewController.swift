import UIKit

class DetailsViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    var photo = UIImage()
    var name = String()
    lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    func setupUI(){
        self.view.backgroundColor = .white
        self.title = LocalizedStrings.details.localized
        let backButton = UIBarButtonItem()
        backButton.title = LocalizedStrings.photos.localized
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.view.addSubview(detailImageView)
        self.view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            detailImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            detailImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            detailImageView.heightAnchor.constraint(equalToConstant: 250),
            detailImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24)

        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        detailImageView.image = photo
        nameLabel.text = name
    }
}
