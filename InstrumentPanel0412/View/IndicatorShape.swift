//
//  IndicatorShape.swift
//  InstrumentPanel0412
//
//  Created by 张亚飞 on 2022/4/12.
//

import SwiftUI

struct IndicatorShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            let width = rect.width
            let height = rect.height
            
            path.move(to: CGPoint(x: width / 2, y: 0))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
        }
    }
}

