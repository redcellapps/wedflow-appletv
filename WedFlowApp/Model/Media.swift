//
//  Media.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// Media.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let media = try Media(json)

import Foundation

// MARK: - Media
class Media: Codable {
    var id: String?
    var studioId: String?
    var userId: String?
    var title: String?
    var createdAt: String?
    var updatedAt: String?
    var fileKey: String?
    var fileSize: Int?
    var contentType: String?
    var uploadStatus: String?
    var url: String?
    var thumbs: [JSONAny]?
    var versions: [Version]?
    var detail: MediaDetail?
    var scenes: [Scene]?
    var coverPhoto: CoverPhoto?

    enum CodingKeys: String, CodingKey {
        case id
        case studioId
        case userId
        case title
        case createdAt
        case updatedAt
        case fileKey
        case fileSize
        case contentType
        case uploadStatus
        case url
        case thumbs
        case versions
        case detail
        case scenes
        case coverPhoto
    }

    init(id: String?, studioId: String?, userId: String?, title: String?, createdAt: String?, updatedAt: String?, fileKey: String?, fileSize: Int?, contentType: String?, uploadStatus: String?, url: String?, thumbs: [JSONAny]?, versions: [Version]?, detail: MediaDetail?, scenes: [Scene]?, coverPhoto: CoverPhoto?) {
        self.id = id
        self.studioId = studioId
        self.userId = userId
        self.title = title
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.fileKey = fileKey
        self.fileSize = fileSize
        self.contentType = contentType
        self.uploadStatus = uploadStatus
        self.url = url
        self.thumbs = thumbs
        self.versions = versions
        self.detail = detail
        self.scenes = scenes
        self.coverPhoto = coverPhoto
    }
}

// MARK: Media convenience initializers and mutators

extension Media {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Media.self, from: data)
        self.init(id: me.id, studioId: me.studioId, userId: me.userId, title: me.title, createdAt: me.createdAt, updatedAt: me.updatedAt, fileKey: me.fileKey, fileSize: me.fileSize, contentType: me.contentType, uploadStatus: me.uploadStatus, url: me.url, thumbs: me.thumbs, versions: me.versions, detail: me.detail, scenes: me.scenes, coverPhoto: me.coverPhoto)
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
        studioId: String?? = nil,
        userId: String?? = nil,
        title: String?? = nil,
        createdAt: String?? = nil,
        updatedAt: String?? = nil,
        fileKey: String?? = nil,
        fileSize: Int?? = nil,
        contentType: String?? = nil,
        uploadStatus: String?? = nil,
        url: String?? = nil,
        thumbs: [JSONAny]?? = nil,
        versions: [Version]?? = nil,
        detail: MediaDetail?? = nil,
        scenes: [Scene]?? = nil,
        coverPhoto: CoverPhoto?? = nil
    ) -> Media {
        return Media(
            id: id ?? self.id,
            studioId: studioId ?? self.studioId,
            userId: userId ?? self.userId,
            title: title ?? self.title,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            fileKey: fileKey ?? self.fileKey,
            fileSize: fileSize ?? self.fileSize,
            contentType: contentType ?? self.contentType,
            uploadStatus: uploadStatus ?? self.uploadStatus,
            url: url ?? self.url,
            thumbs: thumbs ?? self.thumbs,
            versions: versions ?? self.versions,
            detail: detail ?? self.detail,
            scenes: scenes ?? self.scenes,
            coverPhoto: coverPhoto ?? self.coverPhoto
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
