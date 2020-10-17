//
//  PageCell.swift
//  AutoLayoutIntroProject
//
//  Created by Joseph Bouhanef on 2020-10-15.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let unwrappedPage = page else { return }
            enthusiastView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText =  NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.black])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let enthusiastView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "enthusiast"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText =  NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.black])
        
        attributedText.append(NSAttributedString(string: "\n\n\nRemember that stress is normal in an abnormal situation. Don't be alarmed if you find yourself feeling worried, dowm, or disconnected at times. These are normal responses to the drastic changes many people are facing.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .white
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageCell {
    
    private func setupLayout() {
        
        let topContainerView = UIView()
        topContainerView.backgroundColor = .white
        addSubview(topContainerView)
        addSubview(descriptionTextView)
        topContainerView.addSubview(enthusiastView)
        
        enthusiastView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        enthusiastView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        enthusiastView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.6).isActive = true
        //remember to enable autolayout
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }    
}


