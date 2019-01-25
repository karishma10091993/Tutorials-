//
//  PractiseVC.swift
//  Collapsable_Expandable_Classes
//
//  Created by kireeti on 10/01/19.
//  Copyright © 2019 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class PractiseVC: UIViewController {

    @IBOutlet var hi: UIView!
    @IBOutlet var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       //hi.addTriangle()
        img.image = UIImage.init(named: "1.jpg")
        imageByDrawingCircle(on: img.image!)
    }
    
    //square
    func imageByDrawingCircle(on image: UIImage) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: image.size.width, height: image.size.height), false, 0.0)
        
        // draw original image into the context
        image.draw(at: CGPoint.zero)
        
        // get the context for CoreGraphics
        let ctx = UIGraphicsGetCurrentContext()!
        
        // set stroking color and draw circle
        ctx.setStrokeColor(UIColor.red.cgColor)
        
        // make circle rect 5 px from border
        var circleRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        circleRect = circleRect.insetBy(dx: 5, dy: 5)
        
        // draw circle
        ctx.strokeEllipse(in: circleRect)
        
        // make image out of bitmap context
        let retImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // free the context
        UIGraphicsEndImageContext()
        
        return retImage;
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class TriangleView: UIView {
    
    //    predefined variables that can be changed
    var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.5)
    var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.5)
    var firstGradientColor: UIColor = UIColor.white
    var secondGradientColor: UIColor = UIColor.blue
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        let height = self.layer.frame.size.height
        let width = self.layer.frame.size.width
        
        //        draw the triangle
        let path = UIBezierPath()
        path.move(to: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()
        
       
        
        //        add path to layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 1.0
        
        //        Add the gradient for the view background if needed
        gradient.colors = [firstGradientColor.cgColor, secondGradientColor.cgColor]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = self.bounds
        gradient.mask = shapeLayer
        
        self.layer.addSublayer(gradient)
    }
}

//Semi Circle View Jusing BeizerPath

class SemiCirleView: UIView {
    
    var semiCirleLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if semiCirleLayer == nil {
            let arcCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
            let circleRadius = bounds.size.width / 2
            let circlePath = UIBezierPath(arcCenter: arcCenter, radius: circleRadius, startAngle: CGFloat.pi, endAngle: CGFloat.pi * 2, clockwise: true)
            
            semiCirleLayer = CAShapeLayer()
            semiCirleLayer.path = circlePath.cgPath
            semiCirleLayer.fillColor = UIColor.red.cgColor
            layer.addSublayer(semiCirleLayer)
            
            // Make the view color transparent
            backgroundColor = UIColor.clear
        }
    }
}
//Semi Circle View Jusing BeizerPath

class CirleView: UIView {
    
    var cirleLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let startAngle = Double.pi/2
        let endAngle = CGFloat(.pi/2 + 2.0*M_PI)
        if cirleLayer == nil {
            let arcCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
            let circleRadius = bounds.size.width / 2
            let circlePath = UIBezierPath(arcCenter: arcCenter, radius: circleRadius, startAngle: CGFloat(startAngle), endAngle: endAngle, clockwise: true)
           
            cirleLayer = CAShapeLayer()
            cirleLayer.path = circlePath.cgPath
            cirleLayer.fillColor = UIColor.orange.cgColor
            layer.addSublayer(cirleLayer)
            
            // Make the view color transparent
            backgroundColor = UIColor.clear
        }
    }
}

//Diamond Shapes
extension UIView {
    func addDiamondMask(cornerRadius: CGFloat = 0) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.minY + cornerRadius))
        path.addLine(to: CGPoint(x: bounds.maxX - cornerRadius, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY - cornerRadius))
        path.addLine(to: CGPoint(x: bounds.minX + cornerRadius, y: bounds.midY))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = cornerRadius * 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineCap = CAShapeLayerLineCap.round

        layer.mask = shapeLayer
    }
    
    
}
