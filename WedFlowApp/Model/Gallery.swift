//
//  Gallery.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

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
    var highlightsVideoId: String?
    var productId: String?
    var subtitle: String?
    var isPrivate: Int?
    var isDownloadable: Int?
    var style: Style?
    var isShareable: Int?
    var urlKey: String?
    var backgroundAudioId: String?
    var studioId: Studioid?
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

    init(id: String?, weddingId: String?, createdAt: String?, updatedAt: String?, type: String?, title: String?, coverPhotoId: String?, highlightsVideoId: String?, productId: String?, subtitle: String?, isPrivate: Int?, isDownloadable: Int?, style: Style?, isShareable: Int?, urlKey: String?, backgroundAudioId: String?, studioId: Studioid?, backgroundVideoId: String?, url: String?, embedUrl: String?, coverPhoto: CoverPhoto?, studio: Studio?, sets: [Set]?) {
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
        self.init(id: me.id, weddingId: me.weddingId, createdAt: me.createdAt, updatedAt: me.updatedAt, type: me.type, title: me.title, coverPhotoId: me.coverPhotoId, highlightsVideoId: me.highlightsVideoId, productId: me.productId, subtitle: me.subtitle, isPrivate: me.isPrivate, isDownloadable: me.isDownloadable, style: me.style, isShareable: me.isShareable, urlKey: me.urlKey, backgroundAudioId: me.backgroundAudioId, studioId: me.studioId, backgroundVideoId: me.backgroundVideoId, url: me.url, embedUrl: me.embedUrl, coverPhoto: me.coverPhoto, studio: me.studio,sets: me.sets)
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
        highlightsVideoId: String?? = nil,
        productId: String?? = nil,
        subtitle: String?? = nil,
        isPrivate: Int?? = nil,
        isDownloadable: Int?? = nil,
        style: Style?? = nil,
        isShareable: Int?? = nil,
        urlKey: String?? = nil,
        backgroundAudioId: String?? = nil,
        studioId: Studioid?? = nil,
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
