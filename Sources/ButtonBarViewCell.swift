//  ButtonBarViewCell.swift
//  XLPagerTabStrip ( https://github.com/xmartlabs/XLPagerTabStrip )
//
//  Copyright (c) 2017 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Foundation

open class ButtonBarViewCell: UICollectionViewCell {

    @IBOutlet open var imageView: UIImageView!
    @IBOutlet open var label: UILabel!

    @IBOutlet weak open var labelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak open var imageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak open var imageViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak open var imageViewCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak open var labelViewCenterXConstraint: NSLayoutConstraint!
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isAccessibilityElement = true
        accessibilityTraits.insert([.button, .header])
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        
        self.label.text = nil
        self.label.attributedText = nil
        self.imageView.image = nil
    }
    
    open override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            super.isSelected = newValue
            if newValue {
                accessibilityTraits.insert(.selected)
            } else {
                accessibilityTraits.remove(.selected)
            }
        }
    }
}
