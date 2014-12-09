// Playground - noun: a place where people can play

import UIKit

class ShadowView : UIView {
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(frame: CGRectZero)
    }
    
    /*
    override func drawRect(rect: CGRect) {
        
        // BEGIN shadows_ios
        // Get the drawing context
        var context = UIGraphicsGetCurrentContext()
        
        // Work out a rectangle to draw in
        var pathRect = CGRectInset(self.bounds,
            self.bounds.size.width * 0.1,
            self.bounds.size.height * 0.1)
        
        // Create a rounded rect path
        var rectanglePath = UIBezierPath(roundedRect: pathRect, cornerRadius: 20)
        
        // Equivalent to NSGraphicsContext.saveGraphicsState()
        CGContextSaveGState(context)
        
        // Prepare the shadow
        var shadow = UIColor.blackColor().CGColor
        var shadowOffset = CGSize(width: 3, height: 3)
        var shadowBlurRadius : CGFloat = 5.0
        
        // This function creates and applies the shadow
        CGContextSetShadowWithColor(context,
                                    shadowOffset,
                                    shadowBlurRadius,
                                    shadow)
        
        // Draw the path; it will have a shadow
        UIColor.redColor().setFill()
        rectanglePath.fill()
        
        // Equivalent to NSGraphicsContext.restoreGraphicsState()
        CGContextRestoreGState(context)
        // END shadows_ios

    }*/
    
    // BEGIN gradients_ios
    override func drawRect(rect: CGRect) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = UIGraphicsGetCurrentContext()
        
        let gradientStartColor = UIColor(red: 0.1, green: 0.1, blue: 0.8,
                                         alpha: 1)
        let gradientEndColor = UIColor(red: 1, green: 0.6, blue: 0.8, alpha: 1)
        
        let gradientColors : CFArray = [gradientStartColor.CGColor,
                                        gradientEndColor.CGColor]
        let gradientLocations : [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColors(colorSpace,
            gradientColors, gradientLocations)
        
        
        let pathRect = CGRectInset(self.bounds, 20, 20)
        
        let topPoint = CGPointMake(self.bounds.size.width / 2, 20)
        let bottomPoint = CGPointMake(self.bounds.size.width / 2,
            self.bounds.size.height - 20)
        
        let roundedRectanglePath = UIBezierPath(roundedRect: pathRect,
                                                cornerRadius: 4)

        CGContextSaveGState(context)
        
        roundedRectanglePath.addClip()
        CGContextDrawLinearGradient(context, gradient, bottomPoint, topPoint, 0)
        
        CGContextRestoreGState(context)
        
    }
    // END gradients_ios

}

let myView = ShadowView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))


