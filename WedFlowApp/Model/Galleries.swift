// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let galleries = try Galleries(json)

import Foundation

// MARK: - Gallery
class Gallery: Codable {
    var id: String?
    var weddingId: String?
    var createdAt: String?
    var updatedAt: String?
    var type: String?
    var title: String?
    var coverPhotoId: String?
    var highlightsVideoId: JSONNull?
    var productId: String?
    var subtitle: String?
    var isPrivate: Int?
    var isDownloadable: Int?
    var style: Style?
    var isShareable: Int?
    var urlKey: String?
    var backgroundAudioId: JSONNull?
    var studioId: String?
    var backgroundVideoId: String?
    var url: String?
    var embedUrl: String?
    var coverPhoto: CoverPhoto?
    var studio: Studio?
    var sets: [Set]?

    enum CodingKeys: String, CodingKey {
        case id
        case weddingId
        case createdAt
        case updatedAt
        case type
        case title
        case coverPhotoId
        case highlightsVideoId
        case productId
        case subtitle
        case isPrivate
        case isDownloadable
        case style
        case isShareable
        case urlKey
        case backgroundAudioId
        case studioId
        case backgroundVideoId
        case url
        case embedUrl
        case coverPhoto
        case studio
        case sets
    }

    init(id: String?, weddingId: String?, createdAt: String?, updatedAt: String?, type: String?, title: String?, coverPhotoId: String?, highlightsVideoId: JSONNull?, productId: String?, subtitle: String?, isPrivate: Int?, isDownloadable: Int?, style: Style?, isShareable: Int?, urlKey: String?, backgroundAudioId: JSONNull?, studioId: String?, backgroundVideoId: String?, url: String?, embedUrl: String?, coverPhoto: CoverPhoto?, studio: Studio?, sets: [Set]?) {
        self.id = id
        self.weddingId = weddingId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.type = type
        self.title = title
        self.coverPhotoId = coverPhotoId
        self.highlightsVideoId = highlightsVideoId
        self.productId = productId
        self.subtitle = subtitle
        self.isPrivate = isPrivate
        self.isDownloadable = isDownloadable
        self.style = style
        self.isShareable = isShareable
        self.urlKey = urlKey
        self.backgroundAudioId = backgroundAudioId
        self.studioId = studioId
        self.backgroundVideoId = backgroundVideoId
        self.url = url
        self.embedUrl = embedUrl
        self.coverPhoto = coverPhoto
        self.studio = studio
        self.sets = sets
    }
}

// MARK: Gallery convenience initializers and mutators

extension Gallery {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Gallery.self, from: data)
        self.init(id: me.id, weddingId: me.weddingId, createdAt: me.createdAt, updatedAt: me.updatedAt, type: me.type, title: me.title, coverPhotoId: me.coverPhotoId, highlightsVideoId: me.highlightsVideoId, productId: me.productId, subtitle: me.subtitle, isPrivate: me.isPrivate, isDownloadable: me.isDownloadable, style: me.style, isShareable: me.isShareable, urlKey: me.urlKey, backgroundAudioId: me.backgroundAudioId, studioId: me.studioId, backgroundVideoId: me.backgroundVideoId, url: me.url, embedUrl: me.embedUrl, coverPhoto: me.coverPhoto, studio: me.studio, sets: me.sets)
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
        weddingId: String?? = nil,
        createdAt: String?? = nil,
        updatedAt: String?? = nil,
        type: String?? = nil,
        title: String?? = nil,
        coverPhotoId: String?? = nil,
        highlightsVideoId: JSONNull?? = nil,
        productId: String?? = nil,
        subtitle: String?? = nil,
        isPrivate: Int?? = nil,
        isDownloadable: Int?? = nil,
        style: Style?? = nil,
        isShareable: Int?? = nil,
        urlKey: String?? = nil,
        backgroundAudioId: JSONNull?? = nil,
        studioId: String?? = nil,
        backgroundVideoId: String?? = nil,
        url: String?? = nil,
        embedUrl: String?? = nil,
        coverPhoto: CoverPhoto?? = nil,
        studio: Studio?? = nil,
        sets: [Set]?? = nil
    ) -> Gallery {
        return Gallery(
            id: id ?? self.id,
            weddingId: weddingId ?? self.weddingId,
            createdAt: createdAt ?? self.createdAt,
            updatedAt: updatedAt ?? self.updatedAt,
            type: type ?? self.type,
            title: title ?? self.title,
            coverPhotoId: coverPhotoId ?? self.coverPhotoId,
            highlightsVideoId: highlightsVideoId ?? self.highlightsVideoId,
            productId: productId ?? self.productId,
            subtitle: subtitle ?? self.subtitle,
            isPrivate: isPrivate ?? self.isPrivate,
            isDownloadable: isDownloadable ?? self.isDownloadable,
            style: style ?? self.style,
            isShareable: isShareable ?? self.isShareable,
            urlKey: urlKey ?? self.urlKey,
            backgroundAudioId: backgroundAudioId ?? self.backgroundAudioId,
            studioId: studioId ?? self.studioId,
            backgroundVideoId: backgroundVideoId ?? self.backgroundVideoId,
            url: url ?? self.url,
            embedUrl: embedUrl ?? self.embedUrl,
            coverPhoto: coverPhoto ?? self.coverPhoto,
            studio: studio ?? self.studio,
            sets: sets ?? self.sets
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - CoverPhoto
class CoverPhoto: Codable {
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

    init(id: String?, studioId: String?, userId: String?, title: String?, createdAt: String?, updatedAt: String?, fileKey: String?, fileSize: Int?, contentType: String?, uploadStatus: String?, url: String?, thumbs: Thumbs?, versions: [JSONAny]?) {
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
    }

    init(id: String?, title: String?, createdAt: String?, updatedAt: String?, deliverableId: String?, order: Int?, coverPhotoId: String?, media: [Media]?, coverPhoto: CoverPhoto?) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deliverableId = deliverableId
        self.order = order
        self.coverPhotoId = coverPhotoId
        self.media = media
        self.coverPhoto = coverPhoto
    }
}

// MARK: Set convenience initializers and mutators

extension Set {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Set.self, from: data)
        self.init(id: me.id, title: me.title, createdAt: me.createdAt, updatedAt: me.updatedAt, deliverableId: me.deliverableId, order: me.order, coverPhotoId: me.coverPhotoId, media: me.media, coverPhoto: me.coverPhoto)
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
        coverPhoto: CoverPhoto?? = nil
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
    }

    init(id: String?, studioId: String?, userId: String?, title: String?, createdAt: String?, updatedAt: String?, fileKey: String?, fileSize: Int?, contentType: String?, uploadStatus: String?, url: String?, thumbs: [JSONAny]?, versions: [Version]?, detail: MediaDetail?, scenes: [Scene]?) {
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
    }
}

// MARK: Media convenience initializers and mutators

extension Media {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Media.self, from: data)
        self.init(id: me.id, studioId: me.studioId, userId: me.userId, title: me.title, createdAt: me.createdAt, updatedAt: me.updatedAt, fileKey: me.fileKey, fileSize: me.fileSize, contentType: me.contentType, uploadStatus: me.uploadStatus, url: me.url, thumbs: me.thumbs, versions: me.versions, detail: me.detail, scenes: me.scenes)
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
        scenes: [Scene]?? = nil
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

// MARK: - Studio
class Studio: Codable {
    var id: String?
    var name: String?
    var website: String?
    var fbLink: String?
    var instagramLink: String?
    var vimeoLink: String?
    var youtubeLink: String?
    var logo: CoverPhoto?
    var backgroundPhoto: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case website
        case fbLink
        case instagramLink
        case vimeoLink
        case youtubeLink
        case logo
        case backgroundPhoto
    }

    init(id: String?, name: String?, website: String?, fbLink: String?, instagramLink: String?, vimeoLink: String?, youtubeLink: String?, logo: CoverPhoto?, backgroundPhoto: JSONNull?) {
        self.id = id
        self.name = name
        self.website = website
        self.fbLink = fbLink
        self.instagramLink = instagramLink
        self.vimeoLink = vimeoLink
        self.youtubeLink = youtubeLink
        self.logo = logo
        self.backgroundPhoto = backgroundPhoto
    }
}

// MARK: Studio convenience initializers and mutators

extension Studio {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Studio.self, from: data)
        self.init(id: me.id, name: me.name, website: me.website, fbLink: me.fbLink, instagramLink: me.instagramLink, vimeoLink: me.vimeoLink, youtubeLink: me.youtubeLink, logo: me.logo, backgroundPhoto: me.backgroundPhoto)
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
        name: String?? = nil,
        website: String?? = nil,
        fbLink: String?? = nil,
        instagramLink: String?? = nil,
        vimeoLink: String?? = nil,
        youtubeLink: String?? = nil,
        logo: CoverPhoto?? = nil,
        backgroundPhoto: JSONNull?? = nil
    ) -> Studio {
        return Studio(
            id: id ?? self.id,
            name: name ?? self.name,
            website: website ?? self.website,
            fbLink: fbLink ?? self.fbLink,
            instagramLink: instagramLink ?? self.instagramLink,
            vimeoLink: vimeoLink ?? self.vimeoLink,
            youtubeLink: youtubeLink ?? self.youtubeLink,
            logo: logo ?? self.logo,
            backgroundPhoto: backgroundPhoto ?? self.backgroundPhoto
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

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

typealias Galleries = [Gallery]

extension Array where Element == Galleries.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Galleries.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let galleries = try Galleries(json)
//
//import Foundation
//
//// MARK: - Gallery
//class Gallery: Codable {
//    var id: String?
//    var weddingId: String?
//    var createdAt: String?
//    var updatedAt: String?
//    var type: String?
//    var title: String?
//    var coverPhotoId: String?
//    var highlightsVideoId: String?
//    var productId: String?
//    var subtitle: String?
//    var isPrivate: Int?
//    var isDownloadable: Int?
//    var style: Style?
//    var isShareable: Int?
//    var urlKey: String?
//    var backgroundAudioId: String?
//    var studioId: Studioid?
//    var backgroundVideoId: String?
//    var url: String?
//    var embedUrl: String?
//    var coverPhoto: CoverPhoto?
//    var studio: Studio?
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
//    }
//
//    init(id: String?, weddingId: String?, createdAt: String?, updatedAt: String?, type: String?, title: String?, coverPhotoId: String?, highlightsVideoId: String?, productId: String?, subtitle: String?, isPrivate: Int?, isDownloadable: Int?, style: Style?, isShareable: Int?, urlKey: String?, backgroundAudioId: String?, studioId: Studioid?, backgroundVideoId: String?, url: String?, embedUrl: String?, coverPhoto: CoverPhoto?, studio: Studio?) {
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
//    }
//}
//
//// MARK: Gallery convenience initializers and mutators
//
//extension Gallery {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Gallery.self, from: data)
//        self.init(id: me.id, weddingId: me.weddingId, createdAt: me.createdAt, updatedAt: me.updatedAt, type: me.type, title: me.title, coverPhotoId: me.coverPhotoId, highlightsVideoId: me.highlightsVideoId, productId: me.productId, subtitle: me.subtitle, isPrivate: me.isPrivate, isDownloadable: me.isDownloadable, style: me.style, isShareable: me.isShareable, urlKey: me.urlKey, backgroundAudioId: me.backgroundAudioId, studioId: me.studioId, backgroundVideoId: me.backgroundVideoId, url: me.url, embedUrl: me.embedUrl, coverPhoto: me.coverPhoto, studio: me.studio)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        id: String?? = nil,
//        weddingId: String?? = nil,
//        createdAt: String?? = nil,
//        updatedAt: String?? = nil,
//        type: String?? = nil,
//        title: String?? = nil,
//        coverPhotoId: String?? = nil,
//        highlightsVideoId: String?? = nil,
//        productId: String?? = nil,
//        subtitle: String?? = nil,
//        isPrivate: Int?? = nil,
//        isDownloadable: Int?? = nil,
//        style: Style?? = nil,
//        isShareable: Int?? = nil,
//        urlKey: String?? = nil,
//        backgroundAudioId: String?? = nil,
//        studioId: Studioid?? = nil,
//        backgroundVideoId: String?? = nil,
//        url: String?? = nil,
//        embedUrl: String?? = nil,
//        coverPhoto: CoverPhoto?? = nil,
//        studio: Studio?? = nil
//    ) -> Gallery {
//        return Gallery(
//            id: id ?? self.id,
//            weddingId: weddingId ?? self.weddingId,
//            createdAt: createdAt ?? self.createdAt,
//            updatedAt: updatedAt ?? self.updatedAt,
//            type: type ?? self.type,
//            title: title ?? self.title,
//            coverPhotoId: coverPhotoId ?? self.coverPhotoId,
//            highlightsVideoId: highlightsVideoId ?? self.highlightsVideoId,
//            productId: productId ?? self.productId,
//            subtitle: subtitle ?? self.subtitle,
//            isPrivate: isPrivate ?? self.isPrivate,
//            isDownloadable: isDownloadable ?? self.isDownloadable,
//            style: style ?? self.style,
//            isShareable: isShareable ?? self.isShareable,
//            urlKey: urlKey ?? self.urlKey,
//            backgroundAudioId: backgroundAudioId ?? self.backgroundAudioId,
//            studioId: studioId ?? self.studioId,
//            backgroundVideoId: backgroundVideoId ?? self.backgroundVideoId,
//            url: url ?? self.url,
//            embedUrl: embedUrl ?? self.embedUrl,
//            coverPhoto: coverPhoto ?? self.coverPhoto,
//            studio: studio ?? self.studio
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - CoverPhoto
//class CoverPhoto: Codable {
//    var id: String?
//    var studioId: Studioid?
//    var userId: UserId?
//    var title: String?
//    var createdAt: String?
//    var updatedAt: String?
//    var fileKey: String?
//    var fileSize: Int?
//    var contentType: ContentType?
//    var uploadStatus: UploadStatus?
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
//    init(id: String?, studioId: Studioid?, userId: UserId?, title: String?, createdAt: String?, updatedAt: String?, fileKey: String?, fileSize: Int?, contentType: ContentType?, uploadStatus: UploadStatus?, url: String?, thumbs: Thumbs?, versions: [JSONAny]?) {
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
//// MARK: CoverPhoto convenience initializers and mutators
//
//extension CoverPhoto {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(CoverPhoto.self, from: data)
//        self.init(id: me.id, studioId: me.studioId, userId: me.userId, title: me.title, createdAt: me.createdAt, updatedAt: me.updatedAt, fileKey: me.fileKey, fileSize: me.fileSize, contentType: me.contentType, uploadStatus: me.uploadStatus, url: me.url, thumbs: me.thumbs, versions: me.versions)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        id: String?? = nil,
//        studioId: Studioid?? = nil,
//        userId: UserId?? = nil,
//        title: String?? = nil,
//        createdAt: String?? = nil,
//        updatedAt: String?? = nil,
//        fileKey: String?? = nil,
//        fileSize: Int?? = nil,
//        contentType: ContentType?? = nil,
//        uploadStatus: UploadStatus?? = nil,
//        url: String?? = nil,
//        thumbs: Thumbs?? = nil,
//        versions: [JSONAny]?? = nil
//    ) -> CoverPhoto {
//        return CoverPhoto(
//            id: id ?? self.id,
//            studioId: studioId ?? self.studioId,
//            userId: userId ?? self.userId,
//            title: title ?? self.title,
//            createdAt: createdAt ?? self.createdAt,
//            updatedAt: updatedAt ?? self.updatedAt,
//            fileKey: fileKey ?? self.fileKey,
//            fileSize: fileSize ?? self.fileSize,
//            contentType: contentType ?? self.contentType,
//            uploadStatus: uploadStatus ?? self.uploadStatus,
//            url: url ?? self.url,
//            thumbs: thumbs ?? self.thumbs,
//            versions: versions ?? self.versions
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//enum ContentType: String, Codable {
//    case imagejpeg = "image/jpeg"
//    case imagepng = "image/png"
//}
//
//enum Studioid: String, Codable {
//    case e7S4I2Hq = "e7s4i2hq"
//    case the7Rsz17P9 = "7rsz17p9"
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
//// MARK: Thumbs convenience initializers and mutators
//
//extension Thumbs {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Thumbs.self, from: data)
//        self.init(sm: me.sm, md: me.md, lg: me.lg)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        sm: String?? = nil,
//        md: String?? = nil,
//        lg: String?? = nil
//    ) -> Thumbs {
//        return Thumbs(
//            sm: sm ?? self.sm,
//            md: md ?? self.md,
//            lg: lg ?? self.lg
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//enum UploadStatus: String, Codable {
//    case uploaded = "UPLOADED"
//}
//
//enum UserId: String, Codable {
//    case c7Bclcdh = "c7bclcdh"
//    case kwfndzvg = "kwfndzvg"
//}
//
//// MARK: - Studio
//class Studio: Codable {
//    var id: Studioid?
//    var name: String?
//    var website: String?
//    var fbLink: String?
//    var instagramLink: String?
//    var vimeoLink: String?
//    var youtubeLink: String?
//    var logo: CoverPhoto?
//    var backgroundPhoto: CoverPhoto?
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
//    init(id: Studioid?, name: String?, website: String?, fbLink: String?, instagramLink: String?, vimeoLink: String?, youtubeLink: String?, logo: CoverPhoto?, backgroundPhoto: CoverPhoto?) {
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
//// MARK: Studio convenience initializers and mutators
//
//extension Studio {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Studio.self, from: data)
//        self.init(id: me.id, name: me.name, website: me.website, fbLink: me.fbLink, instagramLink: me.instagramLink, vimeoLink: me.vimeoLink, youtubeLink: me.youtubeLink, logo: me.logo, backgroundPhoto: me.backgroundPhoto)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        id: Studioid?? = nil,
//        name: String?? = nil,
//        website: String?? = nil,
//        fbLink: String?? = nil,
//        instagramLink: String?? = nil,
//        vimeoLink: String?? = nil,
//        youtubeLink: String?? = nil,
//        logo: CoverPhoto?? = nil,
//        backgroundPhoto: CoverPhoto?? = nil
//    ) -> Studio {
//        return Studio(
//            id: id ?? self.id,
//            name: name ?? self.name,
//            website: website ?? self.website,
//            fbLink: fbLink ?? self.fbLink,
//            instagramLink: instagramLink ?? self.instagramLink,
//            vimeoLink: vimeoLink ?? self.vimeoLink,
//            youtubeLink: youtubeLink ?? self.youtubeLink,
//            logo: logo ?? self.logo,
//            backgroundPhoto: backgroundPhoto ?? self.backgroundPhoto
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
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
//// MARK: Style convenience initializers and mutators
//
//extension Style {
//    convenience init(data: Data) throws {
//        let me = try newJSONDecoder().decode(Style.self, from: data)
//        self.init(bodyFont: me.bodyFont, accentColor: me.accentColor, headingFont: me.headingFont, primaryColor: me.primaryColor, secondaryColor: me.secondaryColor)
//    }
//
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    convenience init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        bodyFont: String?? = nil,
//        accentColor: String?? = nil,
//        headingFont: String?? = nil,
//        primaryColor: String?? = nil,
//        secondaryColor: String?? = nil
//    ) -> Style {
//        return Style(
//            bodyFont: bodyFont ?? self.bodyFont,
//            accentColor: accentColor ?? self.accentColor,
//            headingFont: headingFont ?? self.headingFont,
//            primaryColor: primaryColor ?? self.primaryColor,
//            secondaryColor: secondaryColor ?? self.secondaryColor
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//typealias Galleries = [Gallery]
//
//extension Array where Element == Galleries.Element {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Galleries.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
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
//
