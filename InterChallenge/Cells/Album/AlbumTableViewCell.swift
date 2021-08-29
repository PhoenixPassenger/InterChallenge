import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private func setupUI(){
        self.contentView.addSubview(albumNameLabel)
        NSLayoutConstraint.activate([
            albumNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            albumNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            albumNameLabel.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            albumNameLabel.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8)

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
