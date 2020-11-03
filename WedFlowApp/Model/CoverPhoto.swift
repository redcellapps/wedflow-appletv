//
//  CoverPhoto.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// CoverPhoto.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coverPhoto = try CoverPhoto(json)

import Foundation

// MARK: - CoverPhoto
class CoverPhoto: Codable {
    var id: String?
    var studioId: Studioid?
    var userId: UserId?
    var title: String?
    var createdAt: String?
    var updatedAt: String?
    var fileKey: String?
    var fileSize: Int?
    var contentType: ContentType?
    var uploadStatus: UploadStatus?
    var url: String?
    var thumbs: Thumbs?
    var versions: [JSONAny]?

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
    }

    init(id: String?, studioId: Studioid?, userId: UserId?, title: String?, createdAt: String?, updatedAt: String?, fileKey: String?, fileSize: Int?, contentType: ContentType?, uploadStatus: UploadStatus?, url: String?, thumbs: Thumbs?, versions: [JSONAny]?) {
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
    }
}

// MARK: CoverPhoto convenience initializers and mutators

extension CoverPhoto {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(CoverPhoto.self, from: data)
        self.init(id: me.id, studioId: me.studioId, userId: me.userId, title: me.title, createdAt: me.createdAt, updatedAt: me.updatedAt, fileKey: me.fileKey, fileSize: me.fileSize, contentType: me.contentType, uploadStatus: me.uploadStatus, url: me.url, thumbs: me.thumbs, versions: me.versions)
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
        studioId: Studioid?? = nil,
        userId: UserId?? = nil,
        title: String?? = nil,
        createdAt: String?? = nil,
        updatedAt: String?? = nil,
        fileKey: String?? = nil,
        fileSize: Int?? = nil,
        contentType: ContentType?? = nil,
        uploadStatus: UploadStatus?? = nil,
        url: String?? = nil,
        thumbs: Thumbs?? = nil,
        versions: [JSONAny]?? = nil
    ) -> CoverPhoto {
        return CoverPhoto(
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
            versions: versions ?? self.versions
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
