//
//  RegViewModel.swift
//  App1235
//
//  Created by IGOR on 13/03/2025.
//

import SwiftUI

final class RegViewModel: ObservableObject {

    @AppStorage("login") var login: String = ""
    @AppStorage("password") var password: String = ""
    @Published var addLogin: String = ""
    @Published var addPassword: String = ""
    @Published var addPassword2: String = ""

    @AppStorage("status") var status: Bool = false
    @Published var isDelete: Bool = false

}

