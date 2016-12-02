//
//  ImageHelper.swift
//  iOSProjectBase
//
//  Created by admin on 16/5/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

/**
 generate image with color
 - returns: the image size will be (1.0, 1.0)
 */
public func imageWithColor(_ color: UIColor) -> UIImage {
    return imageWithColor(color, size: CGSize(width: 1.0, height: 1.0))
}

/**
 generate image with color and size
 */
public func imageWithColor(_ color: UIColor, size:CGSize) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
    UIGraphicsBeginImageContext(size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}

/**
 Compress image
 */
public func imageFromSource(_ image : UIImage, compressedToWidth newWidth : CGFloat) -> UIImage {
    var height = image.size.height
    let width = image.size.width
    height = height * newWidth / width
    let newSize = CGSize(width: newWidth, height: height)
    return imageFromSource(image, compressedToSize: newSize)
}

/**
 Compress image
 */
public func imageFromSource(_ image : UIImage, compressedToSize size : CGSize) -> UIImage {
    UIGraphicsBeginImageContext(size)
    image.draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage!
}

public func imageFromSource(_ image: UIImage, frame: CGRect) -> UIImage? {
    let imageRef = image.cgImage?.cropping(to: frame)
    if let ref = imageRef {
        let image = UIImage(cgImage: ref)
        return image
    }
    return nil
}

public var screenShot: UIImage? {
    return UIApplication.shared.keyWindow?.snapshot
}
