import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        return label
    }()
    
    private func setupUI(){
        self.contentView.addSubview(photoImageView)
        self.contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: 150),
            photoImageView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            photoImageView.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            photoImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -16),

            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 60)

        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
