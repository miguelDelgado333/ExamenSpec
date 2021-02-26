//
//  LoginViewController.swift
//  Examen_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 24/02/21.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var registerButton: UIButton!
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  var presenter: LoginPresenterProtocol?
  private var constants: Constants = Constants()

  @IBAction func loginButton(_ sender: Any) {
    guard let userNameText = userNameTextField.text, let passwordText = passwordTextField.text else { return }
    presenter?.loginUser(newUser: userNameText, with: passwordText)
  }
  @IBAction func registerButton(_ sender: Any) {
    guard let userNameText = userNameTextField.text, let passwordText = passwordTextField.text else { return }
    presenter?.registerUser(newUser: userNameText, with: passwordText)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpView()
  }

  private func setUpView() {
    presenter = LoginPresenter(view: self)
    loginButton.setTitle("Login", for: .normal)
    registerButton.setTitle("Registrar", for: .normal)
  }

  func showAlert(errorMessage: String) {
    let alert = UIAlertController(title: constants.errorText, message: errorMessage, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: constants.agreeText, style: .cancel, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}

extension LoginViewController: LoginViewProtocol {
}
