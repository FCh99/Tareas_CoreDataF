//
//  AddViewController.swift
//  TareasApp_CoreDataF
//
//  Created by Fausto Checa on 14/7/17.
//  Copyright © 2017 Fausto Checa. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var nuevaTareaTextField: UITextField!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func añadirTareaAction(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
       let tareaNew = Tarea(context: context)
        tareaNew.nombre = nuevaTareaTextField.text
        
        // Salvar a Core Data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
        
        
        
    }
    

    
    
    
}
