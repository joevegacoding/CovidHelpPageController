//
//  SwipingController.swift
//  AutoLayoutIntroProject
//
//  Created by Joseph Bouhanef on 2020-10-14.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let previewsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        print("trying to advance to the next page")
        let nextIndex = min(pageController.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        //this resets the number of the current page
        pageController.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
    @objc private func handlePrevious() {
        let nextIndex = max(pageController.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        //this resets the number of the current page
        pageController.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }
    
     lazy var pageController: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = .systemPink
        return pageControl
    }()
    
    let pages = [
        Page(imageName: "from home", headerText: "Stay Home And Be Safe", bodyText: "The fewer people you’re around, the lower your chance of infection. When you stay home, you help stop the spread to others, too. Don’t go to crowded places. If your community is under shelter-in-place orders, follow proper guidelines for when you can leave your home. Keep a stock of supplies like food and medicine, so you can hunker down when you need to.The main way COVID-19 spreads is from person-to-person contact. Contact is more than touching. When someone coughs or sneezes near you, droplets from their nose and mouth go into the air."),
        Page(imageName: "back to work", headerText: "Protect Yourself And Protect Others", bodyText: "Masks are recommended as a simple barrier to help prevent respiratory droplets from traveling into the air and onto other people when the person wearing the mask coughs, sneezes, talks, or raises their voice. This is called source control. This recommendation is based on what we know about the role respiratory droplets play in the spread of the virus that causes COVID-19, paired with emerging evidence from clinical and laboratory studies that shows masks reduce the spray of droplets when worn over the nose and mouth."),
        Page(imageName: "social distancing", headerText: "Practice Social Distancing", bodyText: "The CDC defines social distancing as it applies to COVID-19 as remaining out of congregate settings, avoiding mass gatherings, and maintaining distance (approximately 6 feet or 2 meters) from others when possible. This means no hugs and no handshakes. It's particularly important—and perhaps obvious—to maintain that same 6-foot distance from anyone outside of your circle."),
        Page(imageName: "video call", headerText: "Work From Home", bodyText: "As we’ve long known, remote work has a host of advantages for workers. We’re listing out the best of the best benefits of working from home—some you may already be aware of, and some that may open your eyes even more to remote work’s impact on employers, employees, the economy, and the planet."),
        Page(imageName: "women sitting", headerText: "Be Creative", bodyText: "Right now, many of us are inside sheltering in place to protect ourselves and our loved ones from the spread of the novel coronavirus. As far as creativity goes, there are pros and cons that come with this new normal. On one hand, you may have more time on your hands to create; on the other, whether you’re having trouble focusing or you’re feeling frozen by anxiety, being at home can be challenging. To help boost your inner creative self, you can learn something new everyday, find your creative system and exercise."),
        Page(imageName: "enthusiast", headerText: "Stay Positve And Be Awesome!", bodyText: "Remember that stress is normal in an abnormal situation. Don't be alarmed if you find yourself feeling worried, dowm, or disconnected at times. These are normal responses to the drastic changes many people are facing.")
    ]
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        collectionViewSetup()
    }
}

extension SwipingController {
    
    private func setupBottomControls() {
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previewsButton, pageController, nextButton])
        view.addSubview(bottomControlStackView)
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomControlStackView.distribution = .fillEqually
        previewsButton.backgroundColor = .white
        
        bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomControlStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func collectionViewSetup() {
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.isPagingEnabled = true
    }
}
