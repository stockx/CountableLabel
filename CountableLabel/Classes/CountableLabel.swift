//
//  CountableLabel.swift
//  CountableLabel
//
//  Created by Andrew Foghel on 1/23/19.
//  Copyright © 2019 StockX. All rights reserved.
//

import UIKit

public class CountableLabel: UILabel {
    
    public enum AnimationType {
        case pushUp
        case pushDown
        case fade
        case none
    }
    
    public var animationType: AnimationType = .pushUp
    
    private var previousText = ""
    
    public var placeHolder: String = "" {
        didSet {
            if self.subviews.contains(placeHolderLabel) {
                placeHolderLabel.text = placeHolder
            }
        }
    }
    
    private var originalTextColor: UIColor?
    private var map: NSMutableDictionary?
    
    private var placeHolderLabel = UILabel()
    
    public override var textColor: UIColor! {
        didSet {
            if textColor != .clear {
                originalTextColor = textColor
                textColor = .clear
            }
        }
    }
    
    public init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        textColor = .black
        map = NSMutableDictionary()
        clipsToBounds = true
        showPlaceHolderLabelIfNeeded()
    }
    
    private func showPlaceHolderLabelIfNeeded() {
        if !subviews.contains(placeHolderLabel) {
            addSubview(placeHolderLabel)
            
            placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
            placeHolderLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            placeHolderLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            placeHolderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
            placeHolderLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            
            placeHolderLabel.textAlignment = textAlignment
            placeHolderLabel.font = font
            placeHolderLabel.textColor = originalTextColor
            placeHolderLabel.text = placeHolder
        }
    }
    
    private func size(for text: String?) -> CGSize {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: bounds.height)
        let boundingBox = text?.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return boundingBox?.size ?? .zero
    }
    
    private func resetLabel() {
        for key in 0..<(map?.count ?? 0) {
            let label = map?.object(forKey: key) as? UILabel
            label?.removeFromSuperview()
        }
    }
    
    private func removeLabelsIfNeeded(at indices: [Int]) {
        if !indices.isEmpty {
            for key in indices {
                let label = map?.object(forKey: key) as? UILabel
                label?.removeFromSuperview()
            }
        }
    }
    
    private func handlePushUpAnimation(for newLabel: UILabel, currentLabel: UILabel?, frame: inout CGRect) {
        newLabel.frame = frame
        frame = currentLabel?.frame ?? self.frame
        frame.origin.y -= currentLabel?.bounds.height ?? bounds.height
        currentLabel?.frame = frame
    }
    
    private func handlePushDownAnimation(for newLabel: UILabel, currentLabel: UILabel?, frame: inout CGRect) {
        newLabel.frame = frame
        frame = currentLabel?.frame ?? self.frame
        frame.origin.y = currentLabel?.bounds.height ?? bounds.height
        currentLabel?.frame = frame
    }
    
    private func handleFadeAnimation(for newLabel: UILabel, currentLabel: UILabel?) {
        newLabel.alpha = 1
        currentLabel?.alpha = 0
    }
    
    private func performAnimation(for animationType: AnimationType, newLabel: UILabel, currentLabel: UILabel?) {
        var frame = newLabel.frame
        frame.origin.y = 0
        
        switch self.animationType {
        case .pushUp:
            self.handlePushUpAnimation(for: newLabel, currentLabel: currentLabel, frame: &frame)
        case .pushDown:
            self.handlePushDownAnimation(for: newLabel, currentLabel: currentLabel, frame: &frame)
        case .fade:
            self.handleFadeAnimation(for: newLabel, currentLabel: currentLabel)
        default:
            break
        }
    }
    
    public override var text: String? {
        didSet {
            guard let text = text else {
                resetLabel()
                showPlaceHolderLabelIfNeeded()
                return
            }
            
            guard previousText != text else {
                return
            }
            
            placeHolderLabel.removeFromSuperview()
            
            // if our previous text lenght is greater than our current text,
            // then we will have to remove some labels so that text doesn't linger
            // on screen
            if previousText.count > text.count {
                var indicesToRemove = [Int]()
                
                let difference = previousText.count - text.count
                for index in 0...difference {
                    indicesToRemove.append(text.count + index)
                }
                
                removeLabelsIfNeeded(at: indicesToRemove)
            }
            
            var startX: CGFloat = 0
            let size = self.size(for: text)
            
            if textAlignment == .center {
                startX = bounds.width/2 - size.width/2
            } else if textAlignment == .right {
                startX = bounds.width - size.width
            }
            
            for key in 0..<text.count {
                let range = NSRange(location: key, length: 1)
                let toString = (text as NSString).substring(with: range)
                
                let currentLabel = map?.object(forKey: key) as? UILabel
                
                let size = self.size(for: toString)
                var alpha: CGFloat = 1
                
                var frame: CGRect = .zero
                frame.size = CGSize(width: size.width, height: bounds.height)
                frame.origin = CGPoint(x: startX, y: 0)
                
                if key > 0 {
                    let prevLabel = map?.object(forKey: key - 1) as? UILabel
                    frame.origin.x = prevLabel?.frame.maxX ?? 0
                }
                
                switch animationType {
                case .pushUp:
                    frame.origin.y = bounds.height
                case .pushDown:
                    frame.origin.y = -bounds.height
                case .fade:
                    alpha = 0
                    fallthrough
                case .none:
                    frame.origin.y = 0
                }
                
                let newLabel = UILabel()
                newLabel.textColor = originalTextColor
                newLabel.font = font
                newLabel.text = toString
                newLabel.frame = frame
                newLabel.alpha = alpha
                addSubview(newLabel)
                
                var delay: Double = 0
                var duration: Double = 0.25
                
                switch animationType {
                case .fade:
                    break
                default:
                    delay = .random(in: 0...11) / 100
                    duration += .random(in: 0...6) / 100 * .random(in: 0...1) == 1 ? 1 : -1
                }
                
                UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
                    self.performAnimation(for: self.animationType, newLabel: newLabel, currentLabel: currentLabel)
                }) { _ in
                    currentLabel?.removeFromSuperview()
                }
                
                map?.setObject(newLabel, forKey: key as NSCopying)
            }
            
            previousText = text
        }
    }
}

