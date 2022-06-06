////
////  GalleryFull.swift
////  WedFlowApp
////
////  Created by Momcilo Stankovic on 01/07/2020.
////  Copyright © 2020 RedCellApps. All rights reserved.
////
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let galleryFull = try? newJSONDecoder().decode(GalleryFull.self, from: jsonData)
//
//import Foundation
//
//// MARK: - GalleryFull
//class GalleryFull: Codable {
//    var id: String?
//    var weddingId: String?
//    var createdAt: String?
//    var updatedAt: String?
//    var type: String?
//    var title: String?
//    var coverPhotoId: String?
//    var highlightsVideoId: JSONNull?
//    var productId: String?
//    var subtitle: String?
//    var isPrivate: Int?
//    var isDownloadable: Int?
//    var style: Style?
//    var isShareable: Int?
//    var urlKey: String?
//    var backgroundAudioId: JSONNull?
//    var studioId: String?
//    var backgroundVideoId: String?
//    var url: String?
//    var embedUrl: String?
//    var coverPhoto: CoverPhoto?
//    var studio: Studio?
//    var sets: [Set]?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case weddingId
//        case createdAt
//        case updatedAt
//        case type
//        case title
//        case coverPhotoId
//        case highlightsVideoId
//        case productId
//        case subtitle
//        case isPrivate
//        case isDownloadable
//        case style
//        case isShareable
//        case urlKey
//        case backgroundAudioId
//        case studioId
//        case backgroundVideoId
//        case url
//        case embedUrl
//        case coverPhoto
//        case studio
//        case sets
//    }
//
//    init(id: String?, weddingId: String?, createdAt: String?, updatedAt: String?, type: String?, title: String?, coverPhotoId: String?, highlightsVideoId: JSONNull?, productId: String?, subtitle: String?, isPrivate: Int?, isDownloadable: Int?, style: Style?, isShareable: Int?, urlKey: String?, backgroundAudioId: JSONNull?, studioId: String?, backgroundVideoId: String?, url: String?, embedUrl: String?, coverPhoto: CoverPhoto?, studio: Studio?, sets: [Set]?) {
//        self.id = id
//        self.weddingId = weddingId
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.type = type
//        self.title = title
//        self.coverPhotoId = coverPhotoId
//        self.highlightsVideoId = highlightsVideoId
//        self.productId = productId
//        self.subtitle = subtitle
//        self.isPrivate = isPrivate
//        self.isDownloadable = isDownloadable
//        self.style = style
//        self.isShareable = isShareable
//        self.urlKey = urlKey
//        self.backgroundAudioId = backgroundAudioId
//        self.studioId = studioId
//        self.backgroundVideoId = backgroundVideoId
//        self.url = url
//        self.embedUrl = embedUrl
//        self.coverPhoto = coverPhoto
//        self.studio = studio
//        self.sets = sets
//    }
//}
//
//// MARK: - CoverPhoto
//class CoverPhoto: Codable {
//    var id: String?
//    var studioId: String?
//    var userId: String?
//    var title: String?
//    var createdAt: String?
//    var updatedAt: String?
//    var fileKey: String?
//    var fileSize: Int?
//    var contentType: String?
//    var uploadStatus: String?
//    var url: String?
//    var thumbs: Thumbs?
//    var versions: [JSONAny]?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case studioId
//        case userId
//        case title
//        case createdAt
//        case updatedAt
//        case fileKey
//        case fileSize
//        case contentType
//        case uploadStatus
//        case url
//        case thumbs
//        case versions
//    }
//
//    init(id: String?, studioId: String?, userId: String?, title: String?, createdAt: String?, updatedAt: String?, fileKey: String?, fileSize: Int?, contentType: String?, uploadStatus: String?, url: String?, thumbs: Thumbs?, versions: [JSONAny]?) {
//        self.id = id
//        self.studioId = studioId
//        self.userId = userId
//        self.title = title
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.fileKey = fileKey
//        self.fileSize = fileSize
//        self.contentType = contentType
//        self.uploadStatus = uploadStatus
//        self.url = url
//        self.thumbs = thumbs
//        self.versions = versions
//    }
//}
//
//// MARK: - Thumbs
//class Thumbs: Codable {
//    var sm: String?
//    var md: String?
//    var lg: String?
//
//    enum CodingKeys: String, CodingKey {
//        case sm
//        case md
//        case lg
//    }
//
//    init(sm: String?, md: String?, lg: String?) {
//        self.sm = sm
//        self.md = md
//        self.lg = lg
//    }
//}
//
//// MARK: - Set
//class Set: Codable {
//    var id: String?
//    var title: String?
//    var createdAt: String?
//    var updatedAt: String?
//    var deliverableId: String?
//    var order: Int?
//    var coverPhotoId: String?
//    var media: [Media]?
//    var coverPhoto: CoverPhoto?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case title
//        case createdAt
//        case updatedAt
//        case deliverableId
//        case order
//        case coverPhotoId
//        case media
//        case coverPhoto
//    }
//
//    init(id: String?, title: String?, createdAt: String?, updatedAt: String?, deliverableId: String?, order: Int?, coverPhotoId: String?, media: [Media]?, coverPhoto: CoverPhoto?) {
//        self.id = id
//        self.title = title
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.deliverableId = deliverableId
//        self.order = order
//        self.coverPhotoId = coverPhotoId
//        self.media = media
//        self.coverPhoto = coverPhoto
//    }
//}
//
//// MARK: - Media
//class Media: Codable {
//    var id: String?
//    var studioId: String?
//    var userId: String?
//    var title: String?
//    var createdAt: String?
//    var updatedAt: String?
//    var fileKey: String?
//    var fileSize: Int?
//    var contentType: String?
//    var uploadStatus: String?
//    var url: String?
//    var thumbs: [JSONAny]?
//    var versions: [Version]?
//    var detail: MediaDetail?
//    var scenes: [Scene]?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case studioId
//        case userId
//        case title
//        case createdAt
//        case updatedAt
//        case fileKey
//        case fileSize
//        case contentType
//        case uploadStatus
//        case url
//        case thumbs
//        case versions
//        case detail
//        case scenes
//    }
//
//    init(id: String?, studioId: String?, userId: String?, title: String?, createdAt: String?, updatedAt: String?, fileKey: String?, fileSize: Int?, contentType: String?, uploadStatus: String?, url: String?, thumbs: [JSONAny]?, versions: [Version]?, detail: MediaDetail?, scenes: [Scene]?) {
//        self.id = id
//        self.studioId = studioId
//        self.userId = userId
//        self.title = title
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.fileKey = fileKey
//        self.fileSize = fileSize
//        self.contentType = contentType
//        self.uploadStatus = uploadStatus
//        self.url = url
//        self.thumbs = thumbs
//        self.versions = versions
//        self.detail = detail
//        self.scenes = scenes
//    }
//}
//
//// MARK: - MediaDetail
//class MediaDetail: Codable {
//    var mediaId: String?
//    var duration: Int?
//    var height: Int?
//    var width: Int?
//    var detail: DetailDetail?
//
//    enum CodingKeys: String, CodingKey {
//        case mediaId
//        case duration
//        case height
//        case width
//        case detail
//    }
//
//    init(mediaId: String?, duration: Int?, height: Int?, width: Int?, detail: DetailDetail?) {
//        self.mediaId = mediaId
//        self.duration = duration
//        self.height = height
//        self.width = width
//        self.detail = detail
//    }
//}
//
//// MARK: - DetailDetail
//class DetailDetail: Codable {
//    var codec: String?
//    var width: String?
//    var format: String?
//    var height: String?
//    var bitrate: String?
//    var duration: Int?
//    var fileSize: String?
//    var frameRate: String?
//    var fileExtension: String?
//
//    enum CodingKeys: String, CodingKey {
//        case codec
//        case width
//        case format
//        case height
//        case bitrate
//        case duration
//        case fileSize
//        case frameRate
//        case fileExtension
//    }
//
//    init(codec: String?, width: String?, format: String?, height: String?, bitrate: String?, duration: Int?, fileSize: String?, frameRate: String?, fileExtension: String?) {
//        self.codec = codec
//        self.width = width
//        self.format = format
//        self.height = height
//        self.bitrate = bitrate
//        self.duration = duration
//        self.fileSize = fileSize
//        self.frameRate = frameRate
//        self.fileExtension = fileExtension
//    }
//}
//
//// MARK: - Scene
//class Scene: Codable {
//    var id: String?
//    var mediaId: String?
//    var title: String?
//    var at: Int?
//    var createdAt: String?
//    var updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case mediaId
//        case title
//        case at
//        case createdAt
//        case updatedAt
//    }
//
//    init(id: String?, mediaId: String?, title: String?, at: Int?, createdAt: String?, updatedAt: String?) {
//        self.id = id
//        self.mediaId = mediaId
//        self.title = title
//        self.at = at
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//    }
//}
//
//// MARK: - Version
//class Version: Codable {
//    var url: String?
//    var contentType: String?
//    var status: String?
//
//    enum CodingKeys: String, CodingKey {
//        case url
//        case contentType
//        case status
//    }
//
//    init(url: String?, contentType: String?, status: String?) {
//        self.url = url
//        self.contentType = contentType
//        self.status = status
//    }
//}
//
//// MARK: - Studio
//class Studio: Codable {
//    var id: String?
//    var name: String?
//    var website: String?
//    var fbLink: String?
//    var instagramLink: String?
//    var vimeoLink: String?
//    var youtubeLink: String?
//    var logo: CoverPhoto?
//    var backgroundPhoto: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case website
//        case fbLink
//        case instagramLink
//        case vimeoLink
//        case youtubeLink
//        case logo
//        case backgroundPhoto
//    }
//
//    init(id: String?, name: String?, website: String?, fbLink: String?, instagramLink: String?, vimeoLink: String?, youtubeLink: String?, logo: CoverPhoto?, backgroundPhoto: JSONNull?) {
//        self.id = id
//        self.name = name
//        self.website = website
//        self.fbLink = fbLink
//        self.instagramLink = instagramLink
//        self.vimeoLink = vimeoLink
//        self.youtubeLink = youtubeLink
//        self.logo = logo
//        self.backgroundPhoto = backgroundPhoto
//    }
//}
//
//// MARK: - Style
//class Style: Codable {
//    var bodyFont: String?
//    var accentColor: String?
//    var headingFont: String?
//    var primaryColor: String?
//    var secondaryColor: String?
//
//    enum CodingKeys: String, CodingKey {
//        case bodyFont
//        case accentColor
//        case headingFont
//        case primaryColor
//        case secondaryColor
//    }
//
//    init(bodyFont: String?, accentColor: String?, headingFont: String?, primaryColor: String?, secondaryColor: String?) {
//        self.bodyFont = bodyFont
//        self.accentColor = accentColor
//        self.headingFont = headingFont
//        self.primaryColor = primaryColor
//        self.secondaryColor = secondaryColor
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        // No-op
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
