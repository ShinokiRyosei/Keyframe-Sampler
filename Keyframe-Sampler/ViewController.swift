//
//  ViewController.swift
//  Keyframe-Sampler
//
//  Created by ShinokiRyosei on 2016/11/29.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit


// MARK: - ViewController

class ViewController: UIViewController {
    
    
    // MARK: UIViewController

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let vector: KFVector = try! loadAnimationVector()
        let vectorLayer: KFVectorLayer = KFVectorLayer()
        
        let shortSide = min(self.view.bounds.width, self.view.bounds.height)
        let longSide = max(self.view.bounds.width, self.view.bounds.height)
        
        vectorLayer.frame = CGRect(x: shortSide / 4, y: longSide / 2 - shortSide / 4, width: shortSide / 2, height: shortSide / 2)
        vectorLayer.faceModel = vector
        self.view.layer.addSublayer(vectorLayer)
        vectorLayer.startAnimation()
    }
    
    func loadAnimationVector() throws -> KFVector {
        
        let filePath: String = Bundle(for: type(of: self)).path(forResource: "sample_logo", ofType: "json")!
        let data: Data = try String(contentsOfFile: filePath).data(using: .utf8)!
        let vectorDictionary: Dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
        return KFVectorFromDictionary(vectorDictionary)
    }
}

