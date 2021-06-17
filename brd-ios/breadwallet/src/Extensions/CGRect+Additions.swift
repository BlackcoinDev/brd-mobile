//
//  CGRect+Additions.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2016-11-29.
//  Copyright © 2021 Breadwinner AG. All rights reserved.
//
//  SPDX-License-Identifier: BUSL-1.1
//

import UIKit

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }

    func expandVertically(_ deltaY: CGFloat) -> CGRect {
        var newFrame = self
        newFrame.origin.y -= deltaY
        newFrame.size.height += deltaY
        return newFrame
    }
}
