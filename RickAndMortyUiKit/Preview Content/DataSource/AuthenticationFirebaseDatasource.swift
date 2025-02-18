//
//  AuthenticationFirebaseDatasource.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 18/02/25.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

struct ErrorDescription {
    let errorDescription: String
}

final class AuthenticationFirebaseDatasource {
    func createNewUser(email: String, password : String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error creatinf a new user: \(error)")
                completionBlock(.failure(error))
                return
            }
            guard let email  =  result?.user.email else {
                return
            }
            print("New user created with info \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>)->()) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult,error in
            if let error = error {
                print("error no user found \(error.localizedDescription)")
                completion(.failure(error))
            }
            guard let email =  authDataResult?.user.email else {
                return
            }
            print("User logged in \(email)")
            completion(.success(.init(email: email)))
        }
    }
    
}
