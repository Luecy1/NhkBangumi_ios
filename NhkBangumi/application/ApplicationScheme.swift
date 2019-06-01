//
//  ApplicationScheme.swift
//  NhkBangumi
//
//  Created by 大沼　陽平 on 2019/05/17.
//  Copyright © 2019 Youhei oonuma. All rights reserved.
//
import MaterialComponents

class ApplicationScheme: NSObject {

    private static var singleton = ApplicationScheme()

    public let buttonScheme = MDCButtonScheme()

    static var share: ApplicationScheme {
        return singleton
    }

    override init() {
        self.buttonScheme.colorScheme = self.colorScheme
        self.buttonScheme.typographyScheme = self.typographyScheme
        super.init()
    }

    public let colorScheme: MDCColorScheming = {
        let scheme = MDCSemanticColorScheme()

        let primaryColor = UIColor(red: 0.56, green: 0.79, blue: 0.98, alpha: 1.0);
        let primaryLightColor = UIColor(red: 0.76, green: 0.99, blue: 1.00, alpha: 1.0);
        let primaryDarkColor = UIColor(red: 0.36, green: 0.60, blue: 0.78, alpha: 1.0);
        let primaryTextColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.0);
        let secondaryColor = UIColor(red: 1.00, green: 0.84, blue: 0.31, alpha: 1.0);
        let secondaryLightColor = UIColor(red: 1.00, green: 1.00, blue: 0.51, alpha: 1.0);
        let secondaryDarkColor = UIColor(red: 0.78, green: 0.64, blue: 0.08, alpha: 1.0);
        let secondaryTextColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.0);

        scheme.primaryColor = primaryColor
        scheme.primaryColorVariant = primaryLightColor
        scheme.onPrimaryColor = primaryTextColor
        scheme.secondaryColor = secondaryColor
        scheme.onSecondaryColor = secondaryTextColor
        scheme.surfaceColor =
            UIColor(red: 255.0 / 255.0, green: 251.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
        scheme.onSurfaceColor =
            UIColor(red: 68.0 / 255.0, green: 44.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
        scheme.backgroundColor =             UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        scheme.onBackgroundColor =
            UIColor(red: 68.0 / 255.0, green: 44.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
        scheme.errorColor =
            UIColor(red: 197.0 / 255.0, green: 3.0 / 255.0, blue: 43.0 / 255.0, alpha: 1.0)
        
        return scheme
    }()

    public let typographyScheme: MDCTypographyScheming = {
        let scheme = MDCTypographyScheme()
        return scheme
    }()

    public let shapeScheme: MDCShapeScheming = {
        let scheme = MDCShapeScheme()
        scheme.largeComponentShape = MDCShapeCategory(cornersWith: .cut, andSize: 20)
        return scheme
    }()
}
