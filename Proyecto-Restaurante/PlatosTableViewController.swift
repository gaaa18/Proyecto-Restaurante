//
//  PlatosTableViewController.swift
//  Proyecto-Restaurante
//
//  Created by German Alfredo Alvarenga on 27/3/17.
//  Copyright © 2017 GermanAlfredoAlvarenga. All rights reserved.
//

import UIKit

class PlatosTableViewController: UITableViewController {

    var arrayPlatos = [[String:String]]()
    var parametro1 =  [String:String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confNavBar()
    
        
        /*  -----------------BASE DE DATOS ---------------- */
        //leer la tabla de platos
        if let idCategoria = parametro1["id_categoria"]{
            let query = "SELECT * FROM platos_comidas WHERE id_categoria = \(idCategoria) "
            print(query)
            arrayPlatos = DataBase().ejecutarSelect(query) as! [[String:String]]
        }
        
        /*  -----------------FIN BASE DE DATOS ------------- */
    }
    
    
    //colocar background imagen en NavigationBar
    func confNavBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "v2_barra_titulo"), for: .default)
        
        //colocar imagen como logo en NavBar
        let logo = UIImage(named: "v2_logo")
        self.navigationItem.titleView = UIImageView(image: logo)
        
        //ocultar BackButton
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        self.tabBarController?.tabBar.barTintColor = UIColor(patternImage: UIImage(named: "patronColor")!)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPlatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPlatos", for: indexPath) as! CustomCellPlatosTableViewCell

        // Configure the cell...
        //cell.textLabel?.text = "plato"

        
        let nombreP = arrayPlatos[indexPath.row]["nombre_plato"]
        cell.tituloCellP.text = nombreP
        
        let descripcionP = arrayPlatos[indexPath.row]["descripcion_plato"]
        cell.descripcionCellP.text = descripcionP
        
        let precioP = arrayPlatos[indexPath.row]["precio_plato"]
        cell.precioCellP.text = precioP
        
        if let imagenP = arrayPlatos[indexPath.row]["archivo_plato"]{
            cell.imagenCellP.image = UIImage(named: imagenP)
        }
        
        //cell.tituloCellP.text = "Plato"
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
