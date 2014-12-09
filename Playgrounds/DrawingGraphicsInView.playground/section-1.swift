// Playground - noun: a place where people can play

import Cocoa
import Foundation

// BEGIN base_view
class MyView : NSView {
    // BEGIN empty_view_func
    override func drawRect(rect: NSRect)  {
        
    }
    // END empty_view_func
}
// END base_view

// BEGIN create_base_view
let viewRect = NSRect(x: 0, y: 0, width: 100, height: 100)
let myEmptyView = MyView(frame: viewRect)
// END create_base_view

class RectView : NSView {
    
    /*
    // BEGIN filled_view
    override func drawRect(rect: NSRect) {
        NSColor.greenColor().setFill()
        
        let path = NSBezierPath(rect: self.bounds)
        
        path.fill()
    }
    // END filled_view
    */
    
    /*
    // BEGIN filled_view_ios
    override func drawRect(rect: CGRect)  {
        UIColor.greenColor().setFill()
        
        let path = UIBezierPath(rect: self.bounds)
        
        path.fill()
    }
    // END filled_view_ios
    */
    
    /*
    // BEGIN multiple-subpaths
    override func drawRect(rect: NSRect)  {
        
        // Create an empty Bézier path
        let bezierPath = NSBezierPath()
        
        // Define the rectangles for the two components
        let squareRect = CGRectInset(rect,
            rect.size.width * 0.45,
            rect.size.height * 0.05)
        
        let circleRect = CGRectInset(rect,
            rect.size.width * 0.3,
            rect.size.height * 0.3)
        
        let cornerRadius : CGFloat = 20
        
        // Create the paths
        var circlePath = NSBezierPath(ovalInRect: circleRect);
        var squarePath = NSBezierPath(roundedRect: squareRect, 
                                                   xRadius: cornerRadius,
                                                   yRadius: cornerRadius)
        
        // Add them to the main path
        squarePath.appendBezierPath(circlePath)
        bezierPath.appendBezierPath(squarePath)
        
        // Set the color and draw them
        NSColor.redColor().setFill()
        
        // Draw the path
        bezierPath.fill()
    
    }
    // END multiple-subpaths

    */

    /*
    // BEGIN shadow-example1
    override func drawRect(rect: NSRect)  {
        
        let drawingRect = CGRectInset(rect,
            rect.size.width * 0.1,
            rect.size.height * 0.1);
        
        let cornerRadius : CGFloat = 20
        
        let bezierPath = NSBezierPath(roundedRect: drawingRect,
            xRadius: cornerRadius,
            yRadius: cornerRadius)
        
        // BEGIN save-graphics-state
        NSGraphicsContext.saveGraphicsState()
        // END save-graphics-state
        
        // BEGIN shadows
        let shadow = NSShadow() // <1>
        shadow.shadowColor = NSColor.blackColor() // <2>
        shadow.shadowOffset = NSSize(width: 3, height: -3) // <3>
        shadow.shadowBlurRadius = 10 // <4>
        shadow.set() // <5>
        // END shadows
        
        NSColor.redColor().setFill()
        bezierPath.fill()
        
        // BEGIN load-graphics-state
        NSGraphicsContext.restoreGraphicsState()
        // END load-graphics-state
        
    }
    // END shadow-example1
    */
    
    /*
    // BEGIN shadow-example2
    override func drawRect(rect: NSRect)  {
        
        let drawingRect = CGRectInset(rect,
            rect.size.width * 0.1,
            rect.size.height * 0.1);
        
        let cornerRadius : CGFloat = 20
        
        let bezierPath = NSBezierPath(roundedRect: drawingRect,
            xRadius: cornerRadius,
            yRadius: cornerRadius)
        
        NSGraphicsContext.saveGraphicsState()

        let shadow = NSShadow()
        shadow.shadowColor = NSColor.blackColor()
        shadow.shadowOffset = NSSize(width: 3, height: -3)
        shadow.shadowBlurRadius = 10
        shadow.set()

        NSColor.redColor().setFill()
        bezierPath.fill()
        
        NSGraphicsContext.restoreGraphicsState()
        
    }
    // END shadow-example2
    */
    
    /*
    // BEGIN gradients_osx
    override func drawRect(rect: NSRect)  {
        
        // Defining the shape
        let drawingRect = CGRectInset(rect,
            rect.size.width * 0.1,
            rect.size.height * 0.1);
        
        let cornerRadius : CGFloat = 20
        
        let bezierPath = NSBezierPath(roundedRect: drawingRect,
            xRadius: cornerRadius,
            yRadius: cornerRadius)
        
        // Define the gradient
        // BEGIN gradient_definition
        let startColor = NSColor.blackColor()
        let endColor = NSColor.whiteColor()
        
        let gradient = NSGradient(startingColor:startColor, endingColor:endColor)
        // END gradient_definition
        
        // Draw the gradient in the path
        // BEGIN drawing_gradient_in_path
        gradient.drawInBezierPath(bezierPath, angle: 90)
        // END drawing_gradient_in_path
        
    }
    // END gradients_osx
    */
    
    /*
    // BEGIN custom_bezier_path
    override func drawRect(rect: NSRect) {
        
        var bezierPath = NSBezierPath()
        
        // Create a rectangle that's inset by 5% on all sides
        var drawingRect = CGRectInset(self.bounds, 
                                      self.bounds.size.width * 0.05,
                                      self.bounds.size.height * 0.05);
        
        // Define the points that make up the drawing
        var topLeft = CGPointMake(CGRectGetMinX(drawingRect),
                                  CGRectGetMaxY(drawingRect));
        
        var topRight = CGPointMake(CGRectGetMaxX(drawingRect),
                                   CGRectGetMaxY(drawingRect));

        var bottomRight = CGPointMake(CGRectGetMaxX(drawingRect),
                                      CGRectGetMinY(drawingRect));

        var bottomLeft = CGPointMake(CGRectGetMinX(drawingRect),
                                     CGRectGetMinY(drawingRect));
        
        var center = CGPointMake(CGRectGetMidX(drawingRect),
                                    CGRectGetMidY(drawingRect))
        
        // Start drawing
        bezierPath.moveToPoint(topLeft)
        bezierPath.lineToPoint(topRight)
        bezierPath.lineToPoint(bottomLeft)
        bezierPath.curveToPoint(bottomRight,
                                controlPoint1: center,
                                controlPoint2: center)
        
        // Finish drawing by closing the path
        bezierPath.closePath()
        
        // Set the colors and draw them
        NSColor.redColor().setFill()
        NSColor.blackColor().setStroke()
        
        bezierPath.fill()
        bezierPath.stroke()

    }
    // END custom_bezier_path
    */
    
    
    /*
    // BEGIN filled_rounded_view
    override func drawRect(rect: NSRect)  {
        var pathRect = NSInsetRect(self.bounds, 1, 1);
        
        var path = NSBezierPath(roundedRect:pathRect, xRadius:10, yRadius:10);
        
        path.lineWidth = 4
        
        NSColor.greenColor().setFill();
        NSColor.blackColor().setStroke();
        path.fill()
        path.stroke()
    }
    // END filled_rounded_view
    */
    
    /*
    // BEGIN ios_graphics_context
    var context = UIGraphicsGetCurrentContext()
    // END ios_graphics_context
    */
    
    // BEGIN osx_graphics_context
    var context = NSGraphicsContext.currentContext()?.CGContext
    // END osx_graphics_context
    
    // BEGIN rotation_example
    override func drawRect(rect: NSRect) {
        var pathRect = CGRectInset(self.bounds,
            self.bounds.size.width * 0.1,
            self.bounds.size.height * 0.1)
        
        let cornerRadius : CGFloat = 20.0
        
        var rotationTransform =
            CGAffineTransformMakeRotation(CGFloat(M_PI) / 4.0)
        
        var rectanglePath = NSBezierPath(roundedRect:pathRect,
            xRadius:cornerRadius,
            yRadius:cornerRadius)
        
        var context = NSGraphicsContext.currentContext()!.CGContext
        
        CGContextSaveGState(context)
        
        CGContextConcatCTM(context, rotationTransform)
        
        NSColor.redColor().setFill()
        rectanglePath.fill()
        
        CGContextRestoreGState(context)
        
    }
    // END rotation_example


    

}

let myView = RectView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

