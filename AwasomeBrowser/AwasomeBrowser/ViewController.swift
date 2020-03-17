//
//  ViewController.swift
//  AwasomeBrowser
//
//  Created by Artem Panasenko on 17.03.2020.
//  Copyright © 2020 Artem Panasenko. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.delegate = self // назначаем наш класс делегатом urlTextField // для того что бы наш класс мог принимать значение urlTextField
        webView.navigationDelegate = self // делегируем webView
        
        let homePage = "https://www.apple.com"
        let url = URL(string: homePage)
        let request = URLRequest(url: url!)
        
        urlTextField.text = homePage
        
        webView.load(request)
        //При помощи свайпов можем холить назад/вперед
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardBtnAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
}

// Для того что бы с TextField можно былло вводить адрес нам нужно подписатся под протокол - UITextFieldDelegate
// и использовать метод - textFieldShouldReturn который позволяет вернуть данные с текстовой строки

// Проотокол WKNavigationDelegate - используется для изменения адресной строки при переходе по ссылкам

extension ViewController: UITextFieldDelegate, WKNavigationDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request) // выполняем запрос
        
        textField.resignFirstResponder() // при нажатие return клава скрывается
        
        return true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        urlTextField.text = webView.url?.absoluteString
        
        backBtn.isEnabled = webView.canGoBack //  Если есть возможность возврата назад кнопка ВКЛЮЧИТСЯ
        forwardBtn.isEnabled = webView.canGoForward
    }
}

