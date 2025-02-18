//
//  AuthenticationRepository.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 18/02/25.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationFirebaseDatasource: AuthenticationFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource()) {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDatasource.createNewUser(email: email,
                                                       password: password,
                                                       completionBlock: completionBlock)
    }
    func getCurrentUser() -> User? {
        authenticationFirebaseDatasource.getCurrentUser()
    }
    
    func logout() throws {
        try authenticationFirebaseDatasource.logout()
    }
    
    func login(email: String, password:  String, completion :  @escaping (Result<User, Error>)->()) {
        authenticationFirebaseDatasource.login(email: email, password: password, completion: completion)
    }
}
