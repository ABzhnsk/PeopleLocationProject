//
//  UserTableViewCell.swift
//  PeopleLocation
//
//  Created by Anna Buzhinskaya on 20.03.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    //MARK: - UI elements
    private let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.imageCornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = Constants.spacingStackView
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel(text: "Name",
                            font: .systemFont(ofSize: Constants.fontSize),
                            textAlignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let distanceLabel: UILabel = {
        let label = UILabel(text: "12345 km",
                            font: .systemFont(ofSize: Constants.fontSize),
                            textAlignment: .left)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    private func addSubview() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(distanceLabel)
        contentView.addSubview(photoImageView)
        contentView.addSubview(stackView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.inset),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.inset),
            photoImageView.heightAnchor.constraint(equalToConstant: Constants.imageWidthHeight),
            photoImageView.widthAnchor.constraint(equalToConstant: Constants.imageWidthHeight)
        ])
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: Constants.inset),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.inset),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.inset)
        ])
    }
}

//MARK: - ReusableViewProtocol
extension UserTableViewCell: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
