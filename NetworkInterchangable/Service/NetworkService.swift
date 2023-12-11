//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by onur on 11.12.2023.
//

import Foundation

protocol NetworkService {
    func download(_ resource: String) async throws -> [User]
    var type : String {get}
}
