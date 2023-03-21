//
//  UILabel+Extension.swift
//  PeopleLocation
//
//  Created by Anna Buzhinskaya on 21.03.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
    }
}
