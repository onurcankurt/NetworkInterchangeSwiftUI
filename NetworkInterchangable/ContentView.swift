//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by onur on 11.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init(){
        self.userListViewModel = UserListViewModel()
    }
    
    var body: some View {
        List(userListViewModel.userList, id: \.id) { user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .foregroundStyle(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            await userListViewModel.downloadUser()
        }
    }
}

#Preview {
    ContentView()
}
