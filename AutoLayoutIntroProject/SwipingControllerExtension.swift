//
//  SwipingControllerExtension.swift
//  AutoLayoutIntroProject
//
//  Created by Joseph Bouhanef on 2020-10-17.
//

import Foundation
import UIKit

extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            let indexPath = IndexPath(item: self.pageController.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at:.centeredVertically , animated: true)
            
        }) { (_) in
            
        }
    }
}
