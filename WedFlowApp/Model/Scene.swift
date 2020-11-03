//
//  Scene.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// Scene.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scene = try Scene(json)

import Foundation

// MARK: - Scene
class Scene: Codable {
    var id: String?
    var mediaId: String?
    var title: String?
    var at: Int?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case mediaId
        case title
        case at
        case createdAt
        case updatedAt
    }

    init(id: String?, mediaId: String?, title: String?, at: Int?, createdAt: String?, updatedAt: String?) {
        self.id = id
        self.mediaId = mediaId
        self.title = title
        self.at = at
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

// MARK: Scene convenience initializers and mutators

extension Scene {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Scene.self, from: data)
        self.init(id: me.id, mediaId: me.mediaId, title: me.title, at: me.at, createdAt: me.createdAt, updatedAt: me.updatedAt)
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
        id: String?? = nil,
        mediaId: String?? = nil,
        title: String?? = nil,
        at: Int?? = nil,
        createdAt: String?? = nil,
        updatedAt: String?? = nil
    ) -> Scene {
        return Scene(
            id: id ?? self.id,
            mediaId: mediaId ?? self.mediaId,
            title: title ?? self.title,
            at: at ?? self.at,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
