//
//  WikiViewController.swift
//  Westeros
//
//  Created by Manuel Colmenero Navarro on 17/7/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    // Se obtiene el modelo
    let model : House
    
    // Se inicializa el modelo
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Se sincroniza la vista con el modelo
    func syncViewWithModel() {
        
        // Se le configuran las propiedades
        activityView.isHidden = false
        activityView.startAnimating()
        
        title   = model.name
        
        // Se indica a browserview quien es el delegado (en este caso él mismo)
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: model.wikiURL))
    }
    
    // Se ejecuta la sincronización cuando carga el xib
    override func   viewDidLoad() {
        super.viewDidLoad()
        
        syncViewWithModel()
    }
    
}

extension WikiViewController : UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityView.isHidden = true
        activityView.stopAnimating()
    }
    
    func webView(_ webView: UIWebView,
                 shouldStartLoadWith request: URLRequest,
                 navigationType: UIWebViewNavigationType) -> Bool {
        if (navigationType == .linkClicked)
        || (navigationType == .formSubmitted) {
            return false
        }else {
            return true
        }
    }
}
