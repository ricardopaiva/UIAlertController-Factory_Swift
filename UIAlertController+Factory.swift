//
//  UIAlertController+Factory.swift
//  ConfIRA
//
//  Created by Ricardo Paiva on 25/10/2018.
//  Copyright © 2018 Ricardo Paiva. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    struct LocalizationIdentifiers {
        static let okIdentifierKey = "OK"
    }

    /**
     *  Presents a AlertController with a title, a message and a single button.
     *
     *  @param presentingViewController ViewController where alert controller should be shown.
     *  @param title                    Alert title
     *  @param message                  Alert message
     *  @param buttonTitle              Button title
     *  @param alertControllerStyle     alert controller style (UIAlertControllerStyle)
     *  @param completion               completion block
     */
    class func presentAlert(in presentingViewController: UIViewController,
                            title: String,
                            message: String?,
                            buttonTitle: String = LocalizationIdentifiers.okIdentifierKey.localized(),
                            preferredStyle: UIAlertController.Style = .alert,
                            completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
       
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        
        if preferredStyle == .actionSheet {
            let popover: UIPopoverPresentationController? = alert.popoverPresentationController
            if popover != nil {
                popover?.sourceView = presentingViewController.view
                popover?.sourceRect = (presentingViewController.view)?.bounds ?? CGRect.zero
                popover?.permittedArrowDirections = .any
                
            }
        }
        
        presentingViewController.present(alert, animated: true, completion: completion)
    }
    
    /**
     *  Creates a AlertController with a title and a message.
     *
     *  @param title                Alert title
     *  @param message              Alert message
     *  @param alertControllerStyle Alert controller style (UIAlertControllerStyle)
     *
     *  @return UIAlertController object
     */
    class func alertInViewController(title: String, message: String?, style: UIAlertController.Style) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        return alert
    }
    
    /**
     *  Adds a new actions to the previously created alert controller
     *
     *  @param title                Action title
     *  @param alertControllerStyle Alert controller style (UIAlertControllerStyle)
     *  @param handler              Action handler block
     */
    func addAction(title: String, style: UIAlertAction.Style, handler: ((_ action: UIAlertAction?) -> Void)? = nil) {
        let newAction = UIAlertAction(title: title, style: style, handler: handler)
        addAction(newAction)
    }
    
}

private extension UIAlertController {
    class func present(_ alertController: UIAlertController, in presentingViewController: UIViewController, style: UIAlertController.Style) {
        if style == .actionSheet {
            let popover: UIPopoverPresentationController? = alertController.popoverPresentationController
            if popover != nil {
                popover?.sourceView = presentingViewController.view
                popover?.sourceRect = (presentingViewController.view)?.bounds ?? CGRect.zero
                popover?.permittedArrowDirections = .any
            }
        }
        
        presentingViewController.present(alertController, animated: true)
    }
}
