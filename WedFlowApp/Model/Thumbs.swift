//
//  Thumbs.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// Thumbs.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let thumbs = try Thumbs(json)

import Foundation

// MARK: - Thumbs
class Thumbs: Codable {
    var sm: String?
    var md: String?
    var lg: String?

    enum CodingKeys: String, CodingKey {
        case sm
        case md
        case lg
    }

    init(sm: String?, md: String?, lg: String?) {
        self.sm = sm
        self.md = md
        self.lg = lg
    }
}

// MARK: Thumbs convenience initializers and mutators

extension Thumbs {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Thumbs.self, from: data)
        self.init(sm: me.sm, md: me.md, lg: me.lg)
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
        sm: String?? = nil,
        md: String?? = nil,
        lg: String?? = nil
    ) -> Thumbs {
        return Thumbs(
            sm: sm ?? self.sm,
            md: md ?? self.md,
            lg: lg ?? self.lg
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
