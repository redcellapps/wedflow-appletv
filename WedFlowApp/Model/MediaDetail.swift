//
//  MediaDetail.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// MediaDetail.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mediaDetail = try MediaDetail(json)

import Foundation

// MARK: - MediaDetail
class MediaDetail: Codable {
    var mediaId: String?
    var duration: Int?
    var height: Int?
    var width: Int?
    var detail: DetailDetail?

    enum CodingKeys: String, CodingKey {
        case mediaId
        case duration
        case height
        case width
        case detail
    }

    init(mediaId: String?, duration: Int?, height: Int?, width: Int?, detail: DetailDetail?) {
        self.mediaId = mediaId
        self.duration = duration
        self.height = height
        self.width = width
        self.detail = detail
    }
}

// MARK: MediaDetail convenience initializers and mutators

extension MediaDetail {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(MediaDetail.self, from: data)
        self.init(mediaId: me.mediaId, duration: me.duration, height: me.height, width: me.width, detail: me.detail)
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
        mediaId: String?? = nil,
        duration: Int?? = nil,
        height: Int?? = nil,
        width: Int?? = nil,
        detail: DetailDetail?? = nil
    ) -> MediaDetail {
        return MediaDetail(
            mediaId: mediaId ?? self.mediaId,
            duration: duration ?? self.duration,
            height: height ?? self.height,
            width: width ?? self.width,
            detail: detail ?? self.detail
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
