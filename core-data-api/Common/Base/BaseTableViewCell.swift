//
//  BaseTableViewCell.swift
//  PokeApp
//
//  Created by Topik Mujianto on 21/08/21.
//

import UIKit

class BaseTableViewCell: UITableViewCell, CellIdentifiable {
    // MARK: Properties
    var shouldSetupConstraints = true
    var item: Any?
    
    // MARK: Function
    override func updateConstraints() {
        if shouldSetupConstraints {
            // Auto Layout Constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraint() {
        // Override this to init your constraint
    }
    
    func initView() {
        // Override this to init your view
    }
}

