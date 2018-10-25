//
//  UIAlertController+Factory.swift
//  ConfIRA
//
//  Created by Ricardo Paiva on 25/10/2018.
//  Copyright © 2018 Ricardo Paiva. All rights reserved.
//

import UIKit

extension UIAlertController


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

class func presentAlert(in presentingViewController: UIViewController, title: String, message: String?, buttonTitle: String, preferredStyle alertControllerStyle: UIAlertController.Style, completion: (() -> Void)? = nil) {
    
    //    if ([UIAlertController class]) {  // iOS 8 or above
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: alertControllerStyle)
    
    let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
    alert.addAction(okAction)
    
    if alertControllerStyle == .actionSheet {
        let popover: UIPopoverPresentationController? = alert.popoverPresentationController
        if popover != nil {
            popover?.sourceView = presentingViewController.view
            popover?.sourceRect = (presentingViewController.view as? UIView)?.bounds ?? CGRect.zero
            popover?.permittedArrowDirections = .any

        }
    }
    
    presentingViewController.present(alert, animated: true) completion
    //    } else {
    //        //iOS 7 or below
    //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
    //                                                            message:message
    //                                                           delegate:self
    //                                                  cancelButtonTitle:buttonTitle
    //                                                  otherButtonTitles:nil];
    //        [alertView show];
    //    }

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

class func alertInViewController(withTitle title: String, message: String?, style alertControllerStyle: UIAlertController.Style) -> Any? {
}

/**
 *  Adds a new actions to the previously created alert controller
 *
 *  @param title                Action title
 *  @param alertControllerStyle Alert controller style (UIAlertControllerStyle)
 *  @param handler              Action handler block
 */
func addAction(withTitle title: String, style alertControllerStyle: UIAlertAction.Style, handler: ((_ action: UIAlertAction?) -> Void)? = nil) {
    
    //    if ([UIAlertController class]) {  // iOS 8 or above
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: alertControllerStyle)
    
    return alert
    //    } else {
    //        //iOS 7 or below
    //        NSAssert(NO, @"Not prepared for iOS 7 or below");
    //        return nil;
    //
    //        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
    //        //                                                            message:message
    //        //                                                           delegate:self
    //        //                                                  cancelButtonTitle:buttonTitle
    //        //                                                  otherButtonTitles:nil];
    //        //        return alertView;
    //    }
}

func addAction(withTitle title: String?, style alertControllerStyle: UIAlertAction.Style, handler: ((_ action: UIAlertAction?) -> Void)? = nil) {
    //    if ([UIAlertController class]) {  // iOS 8 or above
    
    let newAction = UIAlertAction(title: title, style: alertControllerStyle, handler: handler)
    addAction(newAction)
    //    } else {
    //        //iOS 7 or below
    //        NSAssert(NO, @"Not prepared for iOS 7 or below");
    //
    //        //        //iOS 7 or below
    //        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
    //        //                                                            message:message
    //        //                                                           delegate:self
    //        //                                                  cancelButtonTitle:buttonTitle
    //        //                                                  otherButtonTitles:nil];
    //        //        return alertView;
    //    }
}

// MARK: - Private methods
class func present(_ alertController: UIAlertController, in presentingViewController: UIViewController, withActionControllerStyle alertControllerStyle: UIAlertController.Style) {
    if alertControllerStyle == .actionSheet {
        let popover: UIPopoverPresentationController? = alertController.popoverPresentationController
        if popover != nil {
            popover?.sourceView = presentingViewController.view
            popover?.sourceRect = (presentingViewController.view as? UIView)?.bounds ?? CGRect.zero
            popover?.permittedArrowDirections = .any
        }
    }
    
    presentingViewController.present(alertController, animated: true)
}
