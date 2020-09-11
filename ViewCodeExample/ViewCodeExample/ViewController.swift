//
//  ViewController.swift
//  ViewCodeExample
//
//  Created by Edgar Sgroi on 11/09/20.
//  Copyright © 2020 Edgar Sgroi. All rights reserved.
//

import UIKit

protocol CodeView {
    func addViewToHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension CodeView {
    func setupView(){
        addViewToHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {
        return
    }
}


// Property Wrapper criado para encapsular uma propriedade que irá se repetir
@propertyWrapper class AutoLayout<T: UIView> {
    private lazy var view: T = {
        let view = T(frame: .zero)
        // O valor "false" foi atribuido pois nós queremos definir os frames da table view com constraints, e não que isso seja feito de forma automática
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = self.backgroundColor
        
        return view
    }()
    var wrappedValue: T {
        return view
    }
    
    private let backgroundColor : UIColor
    init(color: UIColor = .blue) {
        self.backgroundColor = color
    }
}

class ViewController: UIViewController, CodeView {
    
    @AutoLayout(color: .green) private var tableView: UITableView
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func addViewToHierarchy() {
        // Irá adicionar a table view como uma subview da view do viewcontroller. Isso é necessário para que ela seja exibida
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        /* NSLayoutContraint.active ativa todas as contraints que estao sendo passadas no array do parametro
            !-> Um detalhe importante é que as constraints só podem ser configuradas após a view ser adicionada na view principal. Não tem como confirar as contraints de uma view que não existe na tela.
         */
        NSLayoutConstraint.activate([
            
             // view.safeAreaLayoutGuide: respeitará as safe areas apenas do top e bottom
             // view.layoutMarginsGuide: respeitará todas as safe areas, incluse as laterais
             
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

