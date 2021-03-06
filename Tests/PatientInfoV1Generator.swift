/*
 -----------------------------------------------------------------------------
 This source file is part of MedKitAssignedNumbers.

 Copyright 2018 Jon Griffeth

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
import MedKitAssignedNumbers


/**
 Placeholder
 */
class PatientInfoV1Generator {

    typealias Value    = PatientInfoV1
    typealias Iterator = AnyIterator<Value>

    private var count: Int = 0

    init()
    {
    }

    func iterator() -> Iterator
    {
        return Iterator { self.next() }
    }

    private func next() -> Value?
    {
        var value: Value!

        count += 1;
        if (count == 1) {
            var name  = NameV1()
            let photo = ImageV1(named: "Doe, John")

            name.first = "John"
            name.last  = "Doe"

            value = PatientInfoV1(identifier: "ID1", name: name)
            value.photo = photo
        }

        return value
    }

}


// End of File
