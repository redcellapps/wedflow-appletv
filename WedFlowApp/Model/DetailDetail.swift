//
//  DetailDetail.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// DetailDetail.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailDetail = try DetailDetail(json)

import Foundation

// MARK: - DetailDetail
class DetailDetail: Codable {
    var codec: String?
    var width: String?
    var format: String?
    var height: String?
    var bitrate: String?
    var duration: Int?
    var fileSize: String?
    var frameRate: String?
    var fileExtension: String?

    enum CodingKeys: String, CodingKey {
        case codec
        case width
        case format
        case height
        case bitrate
        case duration
        case fileSize
        case frameRate
        case fileExtension
    }

    init(codec: String?, width: String?, format: String?, height: String?, bitrate: String?, duration: Int?, fileSize: String?, frameRate: String?, fileExtension: String?) {
        self.codec = codec
        self.width = width
        self.format = format
        self.height = height
        self.bitrate = bitrate
        self.duration = duration
        self.fileSize = fileSize
        self.frameRate = frameRate
        self.fileExtension = fileExtension
    }
}

// MARK: DetailDetail convenience initializers and mutators

extension DetailDetail {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(DetailDetail.self, from: data)
        self.init(codec: me.codec, width: me.width, format: me.format, height: me.height, bitrate: me.bitrate, duration: me.duration, fileSize: me.fileSize, frameRate: me.frameRate, fileExtension: me.fileExtension)
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
        codec: String?? = nil,
        width: String?? = nil,
        format: String?? = nil,
        height: String?? = nil,
        bitrate: String?? = nil,
        duration: Int?? = nil,
        fileSize: String?? = nil,
        frameRate: String?? = nil,
        fileExtension: String?? = nil
    ) -> DetailDetail {
        return DetailDetail(
            codec: codec ?? self.codec,
            width: width ?? self.width,
            format: format ?? self.format,
            height: height ?? self.height,
            bitrate: bitrate ?? self.bitrate,
            duration: duration ?? self.duration,
            fileSize: fileSize ?? self.fileSize,
            frameRate: frameRate ?? self.frameRate,
            fileExtension: fileExtension ?? self.fileExtension
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
