//
//  Studio.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

// Studio.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let studio = try Studio(json)

import Foundation

// MARK: - Studio
class Studio: Codable {
    var id: String?
    var name: String?
    var website: String?
    var fbLink: String?
    var instagramLink: String?
    var vimeoLink: String?
    var youtubeLink: String?
    var hasPremiumMembership: Bool?
    var logo: CoverPhoto?
    var backgroundPhoto: CoverPhoto?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case website
        case fbLink
        case instagramLink
        case vimeoLink
        case youtubeLink
        case hasPremiumMembership
        case logo
        case backgroundPhoto
    }

    init(id: String?, name: String?, website: String?, fbLink: String?, instagramLink: String?, vimeoLink: String?, youtubeLink: String?, hasPremiumMembership: Bool?, logo: CoverPhoto?, backgroundPhoto: CoverPhoto?) {
        self.id = id
        self.name = name
        self.website = website
        self.fbLink = fbLink
        self.instagramLink = instagramLink
        self.vimeoLink = vimeoLink
        self.youtubeLink = youtubeLink
        self.hasPremiumMembership = hasPremiumMembership
        self.logo = logo
        self.backgroundPhoto = backgroundPhoto
    }
}

// MARK: Studio convenience initializers and mutators

extension Studio {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Studio.self, from: data)
        self.init(id: me.id, name: me.name, website: me.website, fbLink: me.fbLink, instagramLink: me.instagramLink, vimeoLink: me.vimeoLink, youtubeLink: me.youtubeLink, hasPremiumMembership: me.hasPremiumMembership, logo: me.logo, backgroundPhoto: me.backgroundPhoto)
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
        hasPremiumMembership: Bool?? = nil,
        logo: CoverPhoto?? = nil,
        backgroundPhoto: CoverPhoto?? = nil
    ) -> Studio {
        return Studio(
            id: id ?? self.id,
            name: name ?? self.name,
            website: website ?? self.website,
            fbLink: fbLink ?? self.fbLink,
            instagramLink: instagramLink ?? self.instagramLink,
            vimeoLink: vimeoLink ?? self.vimeoLink,
            youtubeLink: youtubeLink ?? self.youtubeLink,
            hasPremiumMembership: hasPremiumMembership ?? self.hasPremiumMembership,
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
