import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: UITableViewCell {
    
    lazy var divisor: UIView = {
        let divisor = UIView()
        divisor.translatesAutoresizingMaskIntoConstraints = false
        divisor.backgroundColor = .systemGray
        self.addSubview(divisor)
        return divisor
    }()
    
    lazy var yellowSquare: UIView = {
        let divisor = UIView()
        divisor.translatesAutoresizingMaskIntoConstraints = false
        divisor.backgroundColor = .systemYellow
        return divisor
    }()
    
    lazy var initialsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var albumsButton: UIButton = {
        var button = UIButton()
        button.clipsToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        let title = localizedStrings.albumsButton.localized
        button.contentMode = .scaleToFill
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        return button
    }()
    
    lazy var postsButton: UIButton = {
        var button = UIButton()
        button.clipsToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        let title = localizedStrings.postsButton.localized
        button.contentMode = .scaleToFill
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        return button
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [albumsButton, postsButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        return stack
    }()
    
    
    var id: Int = 0
    var delegate: UserTableViewCellDelegate?
    
    func setButtonsActions(){
        postsButton.addTarget(self, action: #selector(self.postsAction), for: .touchUpInside)
        albumsButton.addTarget(self, action: #selector(self.albumsAction), for: .touchUpInside)

    }
    
    private func setupUI(){
        setupInitials()
        setButtonsActions()
        self.contentView.addSubview(yellowSquare)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(divisor)
        self.contentView.addSubview(stack)
        self.contentView.addSubview(phoneLabel)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(userNameLabel)
        NSLayoutConstraint.activate([
            divisor.widthAnchor.constraint(equalToConstant: 2),
            divisor.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            yellowSquare.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            yellowSquare.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            yellowSquare.heightAnchor.constraint(equalToConstant: 88),
            yellowSquare.widthAnchor.constraint(equalToConstant: 88),
            yellowSquare.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -16),
            yellowSquare.trailingAnchor.constraint(equalTo: divisor.leadingAnchor, constant: -32),
            
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: divisor.leadingAnchor, constant: -32),
            
            stack.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            stack.topAnchor.constraint(equalTo:divisor.bottomAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            phoneLabel.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            phoneLabel.leadingAnchor.constraint(equalTo: divisor.leadingAnchor, constant: 16),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24),
            
            emailLabel.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailLabel.leadingAnchor.constraint(equalTo: divisor.leadingAnchor, constant: 16),
            emailLabel.bottomAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: -24),
            
            userNameLabel.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userNameLabel.leadingAnchor.constraint(equalTo: divisor.leadingAnchor, constant: 16),
            userNameLabel.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -24),
            userNameLabel.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            
        ])
    }
    
    private func setupInitials(){
        yellowSquare.addSubview(initialsLabel)
        NSLayoutConstraint.activate([
            initialsLabel.topAnchor.constraint(equalTo: yellowSquare.topAnchor),
            initialsLabel.bottomAnchor.constraint(equalTo: yellowSquare.bottomAnchor),
            initialsLabel.leadingAnchor.constraint(equalTo: yellowSquare.leadingAnchor),
            initialsLabel.trailingAnchor.constraint(equalTo: yellowSquare.trailingAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func albumsAction() {
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    @objc func postsAction() {
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
}
