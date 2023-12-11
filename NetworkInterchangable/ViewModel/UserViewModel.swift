//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by onur on 11.12.2023.
//

import Foundation

class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    
    //let webservice = Webservice()
    private var service : NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUser() async {
        
        var resource = ""
        
        if service.type == "Webservice" {
            resource = Constants.Urls.usersExtension
        } else {
            resource = Constants.Paths.baseUrl
        }
        
        do {
            let users = try await service.download(resource)
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
