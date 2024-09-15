//
//  UserController.swift
//
//
//  Created by Sergey on 14.09.2024.
//

import Foundation
import Vapor

struct UserController: RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let users = routes.grouped("users")
        
        users.get(use: getAllUsers)
        
        users.post("create", use: create)
        
        users.group(":userId", configure: { user in
            user.get(use: show)
        })
    }
    
    private func getAllUsers(request: Request) throws -> [User] {
        return [
            .init(name: "Pavel", age: 34),
            .init(name: "Andrei", age: 56),
        ]
    }
    
    private func show(request: Request) throws -> String {
        guard let userId = request.parameters.get("userId") as String? else {
            throw Abort(.badRequest)
        }
        return "Show user for user id = \(userId)"
    }
    
    private func create(request: Request) throws -> String {
        let user = try request.content.decode(User.self)
        
        return user.name
    }
}
