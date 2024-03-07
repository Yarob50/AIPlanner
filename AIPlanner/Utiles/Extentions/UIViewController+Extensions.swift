// MIT License
//
// Copyright (c) 2017-2019 MessageKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit





// MARK:  - UIFont
extension UIFont {
    class func gessTwoBold(size: CGFloat) -> UIFont {
        return UIFont(name: "GE SS Two", size: size)!
    }
    
    class func gessTwoMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "GE SS", size: size)!
    }
    
    class func gessTwoLight(size: CGFloat) -> UIFont {
        return UIFont(name: "GE SS", size: size)!
    }
    
    class func avenierNext(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Next Regular", size: size)!
    }
    
    class func segoUI(size: CGFloat) -> UIFont {
        return UIFont(name: "Segoe UI Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func AvenirLight(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Light", size: size)!
    }
    
    class func AvenirMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Medium", size: size)!
    }
    
    class func AvenirBlack(size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Black", size: size)!
    }
    
    
}
extension UIViewController {
  func updateTitleView(title: String, subtitle: String?) {
    let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    titleLabel.backgroundColor = UIColor.clear
    titleLabel.font = UIFont.gessTwoBold(size: 20)
      titleLabel.textColor = .white
    titleLabel.text = title
    titleLabel.textAlignment = .center
    titleLabel.adjustsFontSizeToFitWidth = true
    titleLabel.sizeToFit()


    let titleView =
      UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, 0), height: 30))
    titleView.addSubview(titleLabel)
      titleLabel.frame = titleView.frame

    let widthDiff =  titleLabel.frame.size.width
      let newX = widthDiff / 2
      titleLabel.frame.origin.x = newX

    navigationItem.titleView = titleView
  }
}
