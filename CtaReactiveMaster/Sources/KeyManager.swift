//
//  KeyManager.swift
//  CtaReactiveMaster
//
//  Created by 神原良継 on 2020/12/19.
//

import Foundation

struct KeyManager {
    private let keyFilePath = Bundle.main.path(forResource: "keys", ofType: "plist")

    func getKeys() -> NSDictionary? {
        guard let keyFilePath = keyFilePath else {
            return nil
        }
        return NSDictionary(contentsOfFile: keyFilePath)
    }

    func getValue(key: String) -> String {
        guard let keys = getKeys() else {
            return ""
        }
        return keys[key] as! String
    }

}
