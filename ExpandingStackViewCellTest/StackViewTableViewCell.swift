//
//  StackViewTableViewCell.swift
//  ExpandingStackViewCellTest
//
//  Created by Russell Sullivan on 8/7/16.
//  Copyright © 2016 Russell Sullivan. All rights reserved.
//

import UIKit

class StackViewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expandSwitch: UISwitch!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet var stackViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bottomLabel.text = "blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah "
        
        stackView.hidden = true
        stackViewHeightConstraint.constant = 0.0
        stackViewHeightConstraint.active = true
    }
    
    override func prepareForReuse() {
        // should use data instead
        stackView.hidden = true
        setNeedsLayout()
    }
    
//    override func setSelected(selected: Bool, animated: Bool) {
//        // dont call super or subviews will lose background OR just not allow the cell to be selected
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
//    override func setHighlighted(highlighted: Bool, animated: Bool) {
//        super.setHighlighted(highlighted, animated: animated)
//        backgroundView?.backgroundColor = highlighted ? UIColor.darkGrayColor() : UIColor.whiteColor()
//    }
    
    @IBAction func switchChanged(sender: AnyObject) {
        print("changed")
    }
    
    func hideViews(hide: Bool) {
        
        if hide == false {
            stackView.hidden = hide
        }
        
        UIView.animateWithDuration(0.3, animations: { 
            self.stackViewHeightConstraint.active = hide
            self.layoutIfNeeded()
            }) { success in
                self.stackView.hidden = hide
        }
    }
}
