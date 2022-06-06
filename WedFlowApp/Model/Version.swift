//
//  Version.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// Version.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let version = try Version(json)

import Foundation

// MARK: - Version
class Version: Codable {
    var url: String?
    var contentType: String?
    var status: String?

    enum CodingKeys: String, CodingKey {
        case url
        case contentType
        case status
    }

    init(url: String?, contentType: String?, status: String?) {
        self.url = url
        self.contentType = contentType
        self.status = status
    }
}

// MARK: Version convenience initializers and mutators

extension Version {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Version.self, from: data)
        self.init(url: me.url, contentType: me.contentType, status: me.status)
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
        url: String?? = nil,
        contentType: String?? = nil,
        status: String?? = nil
    ) -> Version {
        return Version(
            url: url ?? self.url,
            contentType: contentType ?? self.contentType,
            status: status ?? self.status
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
