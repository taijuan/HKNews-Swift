//
//  ImageUtisl.swift
//  HKNews-Swift
//
//  Created by 郑泰捐 on 2019/7/4.
//  Copyright © 2019 郑泰捐. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageUrl:String){
        let url = URL(string: imageUrl)
        //        let w = self.bounds.width
        //        let h = self.bounds.height
        //        logE(any:"width:\(w) , height:\(h)")
        //        let processor = ResizingImageProcessor(referenceSize: CGSize(width: w, height: h), mode: .aspectFit)
        self.kf.setImage(
            with: url,
            placeholder:UIImage(named: "pic_loading"),
            options: [
                //                .processor(processor),
                .transition(.fade(1))
            ]
        )
    }
}

extension UIImage {
    //MARK:创建纯色图片
    class func createColorImage(_ color:UIColor,rect:CGRect)->UIImage?{
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    //MARK:创建渐变图片
    class func createGradientImage(_ gradientColors:[UIColor], rect:CGRect,start:CGPoint? = nil,end:CGPoint? = nil)->UIImage?{
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors:CFArray = gradientColors.map {(color: UIColor) -> CGColor in return color.cgColor} as CFArray
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)!
        context?.drawLinearGradient(gradient, start: start ?? CGPoint(x: 0, y: 0), end: end ?? CGPoint(x: rect.width, y: rect.height), options: CGGradientDrawingOptions(rawValue: 0))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
