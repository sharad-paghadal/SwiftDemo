//
//  FaceView.swift
//  FaceIt
//
//  Created by Sharad Paghadal on 12/02/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

@IBDesignable
class FaceView: UIView {
    
    @IBInspectable
    var scale : CGFloat = 0.90{ didSet{ setNeedsDisplay() } }
    @IBInspectable
    var smile : Bool = true{ didSet{ setNeedsDisplay() } }
    @IBInspectable
    var color : UIColor = UIColor.blue{ didSet{ setNeedsDisplay() } }
    @IBInspectable
    var lineWidth : CGFloat = 5.0{ didSet{ setNeedsDisplay() } }
    @IBInspectable
    var eyeBrowTilt : Double = 0.0{ didSet{ setNeedsDisplay() } }
    @IBInspectable
    var eyeOff : Bool = false{ didSet{ setNeedsDisplay() } }
    
    func tapHandle(_ rec : UITapGestureRecognizer){
        switch rec.state{
        case .ended,.changed :
            if eyeOff {
                eyeOff = false
            }else{
                eyeOff = true
            }
        default :
            break
        }
    }
    
    func pinchHandle(_ rec : UIPinchGestureRecognizer){
        switch rec.state {
        case .changed,.ended :
            scale = scale * rec.scale
            rec.scale = 1.0
        default :
            break
        }
    }
    
    var skullRadius : CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    var skullCenter : CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    private struct Ratios {
        static let SkullRadiusToEyeOffSet : CGFloat = 3
        static let SkullRadiusToEyeRadius : CGFloat = 10
        static let SkullRadiusToMouthWidth : CGFloat = 1
        static let SkullRadiusToMouthHeight : CGFloat = 3
        static let SkullRadiusToMouthOffset: CGFloat = 3
    }
    
    private enum Eye {
        case Left
        case Right
    }
    
    private func pathForCircleCenteredAtPoint(midPoint : CGPoint, withRadius radius : CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: midPoint, radius: radius, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: false)
        path.lineWidth = lineWidth
        return path
    }
    
    private func getEyeCenter(eye : Eye) -> CGPoint{
        let eyeOffset = skullRadius / Ratios.SkullRadiusToEyeOffSet
        var eyeCenter = skullCenter
        eyeCenter.y -= eyeOffset
        switch eye {
        case .Left:
            eyeCenter.x -= eyeOffset
        case .Right:
            eyeCenter.x += eyeOffset
        }
        return eyeCenter
    }
    
    private func pathForEye(eye : Eye) -> UIBezierPath{
        let eyeCenter = getEyeCenter(eye: eye)
        let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
        if eyeOff {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y: eyeCenter.y))
            path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y: eyeCenter.y))
            path.lineWidth = lineWidth
            return path
        }
        return pathForCircleCenteredAtPoint(midPoint: eyeCenter, withRadius: eyeRadius)
    }
    
    private func pathForEyeBrow(eye: Eye) -> UIBezierPath{
        let eyeCenter = getEyeCenter(eye: eye)
        let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
        var eyeBrowStart = eyeCenter
        var eyeBrowEnd = eyeCenter
        
        eyeBrowStart.y -= 2*eyeRadius
        eyeBrowEnd.y -= 2*eyeRadius
        
        let path = UIBezierPath()
        switch eye {
        case .Left:
            eyeBrowStart.x -= eyeRadius
            eyeBrowEnd.x += eyeRadius
        case .Right:
            eyeBrowStart.x += eyeRadius
            eyeBrowEnd.x -= eyeRadius
        }
        
        if eyeBrowTilt < 0.0 {
            eyeBrowEnd.y -= eyeRadius
        }else if eyeBrowTilt > 0.0{
            eyeBrowEnd.y += eyeRadius
        }
        
        path.move(to: eyeBrowStart)
        path.addLine(to: eyeBrowEnd)
        path.lineWidth = lineWidth
        return path
    }
    
    private func pathForMouth() -> UIBezierPath{
        let mouthWidth = skullRadius / Ratios.SkullRadiusToMouthWidth
        let mouthHeight = skullRadius / Ratios.SkullRadiusToMouthHeight
        let mouthOffset = skullRadius / Ratios.SkullRadiusToMouthOffset
        
        let mouthRect = CGRect(x: skullCenter.x - mouthWidth/2, y: skullCenter.y + mouthOffset , width: mouthWidth, height: mouthHeight)
        
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.minY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.minY)
        
        let path = UIBezierPath()
        
        if smile {
            let cp1 = CGPoint(x: mouthRect.minX + mouthRect.width / 3, y: mouthRect.minY + mouthRect.height)
            let cp2 = CGPoint(x: mouthRect.maxX - mouthRect.width / 3, y: mouthRect.minY + mouthRect.height)
            
            path.move(to: start)
            path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        }else{
            let cp3 = CGPoint(x: mouthRect.minX + mouthRect.width / 3, y: mouthRect.minY - mouthRect.height)
            let cp4 = CGPoint(x: mouthRect.maxX - mouthRect.width / 3, y: mouthRect.minY - mouthRect.height)
            
            path.move(to: start)
            path.addCurve(to: end, controlPoint1: cp3, controlPoint2: cp4)
        }
        
        path.lineWidth = lineWidth
        return path
    }
    
    override func draw(_ rect: CGRect) {
        color.set()
        pathForCircleCenteredAtPoint(midPoint: skullCenter, withRadius: skullRadius).stroke()
        pathForEye(eye: .Left).stroke()
        pathForEye(eye: .Right).stroke()
        pathForMouth().stroke()
        pathForEyeBrow(eye: .Left).stroke()
        pathForEyeBrow(eye: .Right).stroke()
    }
}
