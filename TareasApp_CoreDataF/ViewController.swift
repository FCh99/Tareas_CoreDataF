//
//  ViewController.swift
//  TareasApp_CoreDataF
//
//  Created by Fausto Checa on 14/7/17.
//  Copyright © 2017 Fausto Checa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var tareas: [Tarea] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            tareas = try context.fetch(Tarea.fetchRequest())
            
        } catch  {
            print("Ha fallado")
            
        }
        tableView.reloadData()
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // No se puede deque porque no hay Cell con id, se usa la por defecto
        // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        // celda por defecto
        let cell = UITableViewCell()
        
        let tarea = tareas[indexPath.row]
        
        if let myNameString = tarea.nombre {
            cell.textLabel?.text = myNameString
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tarea = tareas[indexPath.row]
            context.delete(tarea)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                tareas = try context.fetch(Tarea.fetchRequest())
            
            }catch{
                print("Falló el Fetch")
            }
            
        }
        tableView.reloadData()
    }

}

