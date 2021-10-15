//
//  SubscriptionViewController.swift
//  Mantra
//
//  Created by Karaimchuk on 22.09.21.
//

import UIKit
import PassKit

class SubscriptionViewController: UIViewController {
  @IBOutlet weak private var applePayButton: UIButton!
  @IBOutlet weak private var informLabel: UILabel!
  
  public var isPaid = false
    
  private var paymentRequest: PKPaymentRequest = {
    let request = PKPaymentRequest()
    request.merchantIdentifier = "mantra.com"
    request.supportedNetworks = [.quicPay, .masterCard, .visa]
    request.supportedCountries = ["US"]
    request.merchantCapabilities = .capability3DS
    
    request.countryCode = "US"
    request.currencyCode = "USD"
    
    request.paymentSummaryItems = [PKPaymentSummaryItem(label: "Pay for subscription", amount: 2.99)]
    return request
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 231.0 / 255.0, green: 246.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    
    setupNavigationBar()
    
    applePayButton.layer.cornerRadius = 10
    applePayButton.addTarget(self, action: #selector(tapForPay), for: .touchUpInside)
  }
  
  @objc func tapForPay() {
    let controller = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)
    if controller != nil {
      controller!.delegate = self
      present(controller!, animated: true) {
        self.isPaid = true
        
        let navController = self.tabBarController?.viewControllers?[1] as? UINavigationController
        let mantrasVC = navController?.topViewController as? MantrasViewController
        mantrasVC?.tableView.reloadData()
      }
    }
  }
  
  private func setupNavigationBar() {
    self.navigationItem.title = "Subscription"
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
}

extension SubscriptionViewController: PKPaymentAuthorizationViewControllerDelegate {
  func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
  
  func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
    completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
  }
  
}
