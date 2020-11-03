//
//  Set.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// Set.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let set = try Set(json)

import Foundation

// MARK: - Set
class Set: Codable {
    var id: String?
    var title: String?
    var createdAt: String?
    var updatedAt: String?
    var deliverableId: String?
    var order: Int?
    var coverPhotoId: String?
    var media: [Media]?
    var coverPhoto: CoverPhoto?
    var scenes: [Scene]?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case createdAt
        case updatedAt
        case deliverableId
        case order
        case coverPhotoId
        case media
        case coverPhoto
        case scenes
    }

    init(id: String?, title: String?, createdAt: String?, updatedAt: String?, deliverableId: String?, order: Int?, coverPhotoId: String?, media: [Media]?, coverPhoto: CoverPhoto?, scenes: [Scene]?) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deliverableId = deliverableId
        self.order = order
        self.coverPhotoId = coverPhotoId
        self.media = media
        self.coverPhoto = coverPhoto
        self.scenes = scenes
    }
}

// MARK: Set convenience initializers and mutators

extension Set {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Set.self, from: data)
        self.init(id: me.id, title: me.title, createdAt: me.createdAt, updatedAt: me.updatedAt, deliverableId: me.deliverableId, order: me.order, coverPhotoId: me.coverPhotoId, media: me.media, coverPhoto: me.coverPhoto, scenes: me.scenes)
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
        title: String?? = nil,
        createdAt: String?? = nil,
        updatedAt: String?? = nil,
        deliverableId: String?? = nil,
        order: Int?? = nil,
        coverPhotoId: String?? = nil,
        media: [Media]?? = nil,
        coverPhoto: CoverPhoto?? = nil,
        scenes: [Scene]?? = nil
    ) -> Set {
        return Set(
            id: id ?? self.id,
            title: title ?? self.title,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            deliverableId: deliverableId ?? self.deliverableId,
            order: order ?? self.order,
            coverPhotoId: coverPhotoId ?? self.coverPhotoId,
            media: media ?? self.media,
            coverPhoto: coverPhoto ?? self.coverPhoto,
            scenes: scenes ?? self.scenes
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
