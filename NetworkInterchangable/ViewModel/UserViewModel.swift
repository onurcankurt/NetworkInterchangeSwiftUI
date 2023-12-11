//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by onur on 11.12.2023.
//

import Foundation

class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    
    let webservice = Webservice()
    
    func downloadUser() async {
        
        do {
            let users = try await webservice.download(Constants.Urls.usersExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
            
        } catch {
            
        }
    }
}

struct UserViewModel {
    
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email : String {
        user.email
    }  
}
