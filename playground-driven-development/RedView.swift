//
//  RedView.swift
//  playground-driven-development
//
//  Created by Erik Zier on 06/05/2017.
//  Copyright © 2017 Erik Zier. All rights reserved.
//

import UIKit

public class RedView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
   
        backgroundColor = UIColor.red
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
