//
//  ViewController.swift
//  Example
//
//  Created by kofktu on 2016. 7. 8..
//  Copyright © 2016년 Kofktu. All rights reserved.
//

import UIKit
import KUIActionSheet

class ViewController: UIViewController {

    @IBAction func onShowDefaultActionSheet(sender: UIButton) {
        let actionSheet = KUIActionSheet.view(parentViewController: self)
        
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴1", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴2", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴3", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        
        actionSheet?.show()
    }
    
    @IBAction func onShowDefaultActionSheetWithCustomView(sender: UIButton) {
        let actionSheet = KUIActionSheet.view(parentViewController: self)
        
        let headerView = HeaderView(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(view.frame), 100.0))
        headerView.backgroundColor = UIColor.redColor()
        
//      with autolayout
//      headerView.translatesAutoresizingMaskIntoConstraints = false
//      headerView.addConstraint(NSLayoutConstraint(item: headerView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50.0))
        
        actionSheet?.add(customView: headerView)
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴1", destructive: false) { [weak self] (item) in
            print(item.title)
            })
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴2", destructive: false) { [weak self] (item) in
            print(item.title)
            })
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴3", destructive: false) { [weak self] (item) in
            print(item.title)
            })
        
        actionSheet?.show()
    }
    
    @IBAction func onShowCustomThemeActionSheet(sender: UIButton) {
        let actionSheet = KUIActionSheet.view(parentViewController: self, theme: KUIActionSheetDark())
        
        actionSheet?.cancelButton.backgroundColor = UIColor.blackColor()
        actionSheet?.cancelButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴1", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴2", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴3", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        
        actionSheet?.show()
    }
    
    @IBAction func onShowCustomXibActionSheet(sender: UIButton) {
        let actionSheet = CustomActionSheet.actionSheet(parentViewController: self)
        
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴1", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴2", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        actionSheet?.add(item: KUIActionSheetItem(title: "메뉴3", destructive: false) { [weak self] (item) in
            print(item.title)
        })
        
        actionSheet?.show()
    }
}

public struct KUIActionSheetDark: KUIActionSheetProtocol {
    public var backgroundColor: UIColor {
        return UIColor(white: 0.0, alpha: 0.4)
    }
    
    public var showAnimationDuration: NSTimeInterval {
        return 0.25
    }
    
    public var dimissAnimationDuration: NSTimeInterval {
        return 0.15
    }
    
    public var blurEffectStyle: UIBlurEffectStyle {
        return .Dark
    }
    
    public var itemTheme: KUIActionSheetItemTheme {
        return KUIActionSheetItemDarkTheme()
    }
}

public struct KUIActionSheetItemDarkTheme: KUIActionSheetItemTheme {
    public var height: CGFloat {
        return 50.0
    }
    
    public var font: UIFont {
        return UIFont.systemFontOfSize(20.0)
    }
    
    public var titleColor: UIColor {
        return UIColor(white: 1.0, alpha: 0.7)
    }
    
    public var destructiveTitleColor: UIColor {
        return UIColor(red: 255/255.0, green: 69/255.0, blue: 57/255.0, alpha: 1.0)
    }
}

class HeaderView: UIView, KUIActionSheetItemViewProtocol {
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        actionSheet?.dismiss()
    }
}

class CustomActionSheet: KUIActionSheet, KUIActionSheetNibLoadableView {
    
    class func actionSheet(parentViewController viewController: UIViewController) -> CustomActionSheet? {
        return CustomActionSheet.viewWithNib(parentViewController: viewController) as? CustomActionSheet
    }
    
}
