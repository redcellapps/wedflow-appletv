//
//  Style.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import Foundation
// Style.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let style = try Style(json)

import Foundation

// MARK: - Style
class Style: Codable {
    var bodyFont: String?
    var accentColor: String?
    var headingFont: String?
    var primaryColor: String?
    var secondaryColor: String?

    enum CodingKeys: String, CodingKey {
        case bodyFont
        case accentColor
        case headingFont
        case primaryColor
        case secondaryColor
    }

    init(bodyFont: String?, accentColor: String?, headingFont: String?, primaryColor: String?, secondaryColor: String?) {
        self.bodyFont = bodyFont
        self.accentColor = accentColor
        self.headingFont = headingFont
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
    }
}

// MARK: Style convenience initializers and mutators

extension Style {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Style.self, from: data)
        self.init(bodyFont: me.bodyFont, accentColor: me.accentColor, headingFont: me.headingFont, primaryColor: me.primaryColor, secondaryColor: me.secondaryColor)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        bodyFont: String?? = nil,
        accentColor: String?? = nil,
        headingFont: String?? = nil,
        primaryColor: String?? = nil,
        secondaryColor: String?? = nil
    ) -> Style {
        return Style(
            bodyFont: bodyFont ?? self.bodyFont,
            accentColor: accentColor ?? self.accentColor,
            headingFont: headingFont ?? self.headingFont,
            primaryColor: primaryColor ?? self.primaryColor,
            secondaryColor: secondaryColor ?? self.secondaryColor
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
