/*
 -----------------------------------------------------------------------------
 This source file is part of MedKitAssignedNumbers.

 Copyright 2017-2018 Jon Griffeth

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 -----------------------------------------------------------------------------
 */


import Foundation
import MedKitCore


/**
 Location Details, Version 1

 An open-ended data structure for managing location details, permitting
 organizations to tailor the data to their needs.
 */
public struct LocationDetailsV1: Codable {

    // MARK: - Properties
    public var details : AnyCodable //: Open-ended location data.
    public var schema  : UUID       //: Used to identify the details schema.

    // MARK: - Private
    private enum CodingKeys: CodingKey {
        case details
        case schema
    }

    // MARK: - Initialize

    public init()
    {
        details = AnyCodable(NSNull())
        schema  = UUID.null
    }

    // MARK: - Codable

    public init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        details = try container.decode(AnyCodable.self, forKey: .details)
        schema  = try container.decode(UUID.self,       forKey: .schema)
    }

    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(details, forKey: .details)
        try container.encode(schema,  forKey: .schema)
    }

}


// End of File
