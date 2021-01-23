//
//  UserRepository.swift
//  FunnyGiphy
//
//  Created by Lee Won-woo on 2021/01/23.
//

import Foundation

protocol UserRepositoryType {
    var count: Int { get }
    func add(userType: UserType)
    func fetch() -> [UserType]
    func user(indexRow: Int) -> UserType?
}

final class UserRepository: UserRepositoryType {
    private var items: [UserType]
    
    var count: Int {
        return items.count
    }
    
    init() {
        items = []
    }
    
    func add(userType: UserType) {
        items.append(userType)
    }
    
    func fetch() -> [UserType] {
        return items
    }
    
    func user(indexRow: Int) -> UserType? {
        guard count > indexRow else { return nil }
        return items[indexRow]
    }
}
