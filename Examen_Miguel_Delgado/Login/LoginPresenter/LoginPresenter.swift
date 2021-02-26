//
//  LoginPresenter.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 24/02/21.
//

import Foundation

class LoginPresenter: NSObject {

  weak var view: LoginViewProtocol?

  required init(view: LoginViewProtocol) {
    self.view = view
  }
}

extension LoginPresenter: LoginPresenterProtocol {
  func registerUser(newUser: String, with password: String) {
    LocalData().saveData(userName: newUser, password: password) { (textAlert) in
      self.view?.showAlert(errorMessage: textAlert)
    }
  }

  func loginUser(newUser: String, with password: String) {
    LocalData().loadData(userName: newUser, password: password) { (loginModel) in
      if loginModel.code == CodeError.success.rawValue {
        print("va al detalle")
      } else {
        self.view?.showAlert(errorMessage: loginModel.textAlert)
      }
    }
  }
}
