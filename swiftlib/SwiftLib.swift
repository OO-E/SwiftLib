//
//  lib.swift
//  swiftlib
//
//  Created by ozgun Mac on 23.06.2016.
//  Copyright © 2016 OOE. All rights reserved.
//

import  UIKit


//:MARK:- Extension UIViewController
extension UIViewController{
    func navigationBackGroundColor(backGColor:UIColor,tintC:UIColor){
        
        self.navigationController!.navigationBar.tintColor = tintC
        self.navigationController!.navigationBar.barTintColor = backGColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
    }
}

//:MARK:- Extension ImageView
extension UIImageView{
    
    class func navigationImageView(name:String)->UIImageView{
        let imageV = UIImageView()
        imageV.frame = CGRect.navigationBarTitleViewHeight()
        imageV.image = UIImage(named: name)
        imageV.layer.masksToBounds = true
        imageV.contentMode = UIViewContentMode.ScaleAspectFit
        return imageV
    }
    func setRadius(cornerRadius:CGFloat,clipsToBounds:Bool,borderWidth:CGFloat,borderColor:UIColor) -> UIImageView{
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
        
        return self
        
    }
    
}
//:MARK:- Extension CGRect
extension CGRect{
    
    static func navigationBarTitleViewHeight()->CGRect{
        
        return CGRect(x: 0, y: 0, width: 82.5, height: 33)
    }

}
//:MARK:- Extension Image
extension UIImage {
    
    func tintImageColor(color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.mainScreen().scale)
        let context :CGContextRef! = UIGraphicsGetCurrentContext()
        
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        
        let rect:CGRect = CGRectMake(0, 0, self.size.width, self.size.height)
        
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        CGContextDrawImage(context, rect, self.CGImage)
        
        CGContextSetBlendMode(context, CGBlendMode.SourceIn)
        color.setFill()
        CGContextFillRect(context, rect)
        
        let coloredImage:UIImage! = UIGraphicsGetImageFromCurrentImageContext().imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        UIGraphicsEndImageContext()
        
        return coloredImage
        
    }
}

//:MARK:- Extension String
extension String {
    func toUInt() -> UInt? {
        let scanner = NSScanner(string: self)
        var u: UInt64 = 0
        if scanner.scanUnsignedLongLong(&u)  && scanner.atEnd {
            return UInt(u)
        }
        return nil
    }
    func toInt()-> Int{
        let con = Int(self)
        return con!
    }
    func toDouble() -> Double? {
        return Double(self)//NSNumberFormatter().numberFromString(self)?.doubleValue
    }
}
//:MARK:- Extension Int
extension Int{
    func toString()->String {
        return "\(self)"
    }
    func toDouble()->Double {
        return Double(self)
    }
    func toFloat()->Float   {
        return Float(self)
    }
}

//:MARK:- Functions
func isValidEmail(testStr:String) -> Bool {
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let range = testStr.rangeOfString(emailRegEx, options:.RegularExpressionSearch)
    let result = range != nil ? true : false
    return result
    
}
func getWaitProcces(style : UIActivityIndicatorViewStyle)->UIView {
    let load = UIActivityIndicatorView(activityIndicatorStyle: style)
    load.frame = CGRectMake(0, 0, 20, 20)
    load.startAnimating()
    
    return load
}
func isValidPhone(value: String) -> Bool {
    
    let charcter  = NSCharacterSet(charactersInString: "555450123456789").invertedSet
    var filtered:NSString!
    let inputString:NSArray = value.componentsSeparatedByCharactersInSet(charcter)
    filtered = inputString.componentsJoinedByString("")
    return  value == filtered
    
}
func localized(string:String) -> String {
    return NSLocalizedString(string,comment:"")
}
func newImageSize(image:UIImage,scaledToSize newSize:CGSize)->UIImage{
    
    UIGraphicsBeginImageContext( newSize )
    image.drawInRect(CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage.imageWithRenderingMode(.AlwaysTemplate)
}
func heightToText(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    
    let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    label.font = font
    label.text = text
    
    label.sizeToFit()
    return label.frame.height
}
func widthToText(text:String, font:UIFont) -> CGFloat{
    
    let label:UILabel = UILabel(frame: CGRectMake(0, 0, CGFloat.max, CGFloat.max))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    label.font = font
    label.text = text
    
    label.sizeToFit()
    return label.frame.width
}
func getRandomColor() -> UIColor{
    
    let randomRed:CGFloat = CGFloat(drand48())
    
    let randomGreen:CGFloat = CGFloat(drand48())
    
    let randomBlue:CGFloat = CGFloat(drand48())
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    
}



