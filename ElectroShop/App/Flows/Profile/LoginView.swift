//
//  LoginView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 23.03.2023.
//

import SwiftUI

struct LoginView: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var isSignInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            VStack {
                Text("Пожалуйста, представьтесь!")
                    .bold()
                    .font(Font.system(size: 22))
                    .padding(.horizontal)
            }
            
            TextField("Login",
                      text: $name,
                      prompt: Text("Логин").foregroundColor(.gray))
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            }
            .padding(.horizontal)
            
            HStack {
                Group {
                    if showPassword {
                        TextField("Password",
                                  text: $password,
                                  prompt: Text("Пароль").foregroundColor(.gray))
                    } else {
                        SecureField("Password",
                                    text: $password,
                                    prompt: Text("Password").foregroundColor(.gray))
                    }
                }
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 2)
                }
            }.padding(.horizontal)
            
            Button {
                if Network().auth(login: name, password: password) == true {
                    NavigationLink {
                        ProfileView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Go to profile")
                    }

                }
            } label: {
                Text("Войти")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                isSignInButtonDisabled ?
                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .disabled(isSignInButtonDisabled)
            .padding()
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
