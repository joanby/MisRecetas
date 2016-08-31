//
//  ViewController.swift
//  MisRecetas
//
//  Created by Juan Gabriel Gomila Salas on 31/8/16.
//  Copyright © 2016 Juan Gabriel Gomila Salas. All rights reserved...
//

import UIKit

class ViewController: UITableViewController { /*UIViewController, UITableViewDataSource, UITableViewDelegate*/

    var recipes : [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        
        var recipe = Recipe(name: "Tortilla de patatas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients: ["Patatas", "Huevos", "Cebolla"],
                            steps: ["Pelar las patatas y la cebolla",
                                    "Cortar las patatas y la cebolla y sofreir",
                                    "Batir los huevos y echarlos durante 1 minuto a la sartén con el resto"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita",
                        image: #imageLiteral(resourceName: "pizza"),
                        time: 60,
                        ingredients: ["Harina", "Levadura", "Aceite", "Sal", "Salsa de Tomate", "Queso"],
                        steps: ["Hacemos la masa con harina, levadura, aceite y sal",
                                "Dejamos reposar la masa 30 minutos",
                                "Extendemos la masa encima de una bandeja y añadimos el resto de ingredientes",
                                "Hornear durante 12 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso",
                        image: #imageLiteral(resourceName: "hamburguesa"),
                        time: 10,
                        ingredients: ["Pan de hamburguesa", "Lechuga", "Tomate", "Queso", "Carne de hamburguesa"],
                        steps: ["Poner al fuego la carne al gusto",
                                "Montar la hamburguesa con sus ingredientes entre los panes"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada César",
                        image: #imageLiteral(resourceName: "ensalada"),
                        time: 15,
                        ingredients: ["Lechuga", "Tomate", "Cebolla", "Pimiento", "Salsa César", "Pollo"],
                        steps: ["Limpiar todas las verduras y trocearlas",
                                "Cocer el pollo al gusto",
                                "Juntar todos los ingredientes en una ensaladera y servir con salsa César por encima"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Paella",
                        image: #imageLiteral(resourceName: "paella"),
                        time: 30,
                        ingredients: ["Arroz Bomba", "Marisco variado", "Caldo de pescado", "Guisantes"],
                        steps: ["Tostar el arroz en una paellera.",
                                "Tras dorarse, echar el caldo de pescado, el marisco y los guisantes.",
                                "Dejar cocer a fuego lento hasta que todo el arroz se haya bebido el caldo."])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Batido de fresa",
                        image: #imageLiteral(resourceName: "batido"),
                        time: 5,
                        ingredients: ["10 fresas maduras", "Leche", "Azúcar"],
                        steps: ["Limpiar y cortar las fresas.",
                                "Mezclarlas con la leche y una cucharada de azúcar",
                                "Triturar hasta que quede hecho papilla."])
        recipes.append(recipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
       
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        
        /*if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        
        /*cell.thumbnailImageView.layer.cornerRadius = 42.0
        cell.thumbnailImageView.clipsToBounds = true
        */
        
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.recipes.remove(at: indexPath.row)
            
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la App del curso de iOS 10 con Juan Gabriel"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }

    
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favouriteActionTitle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite {
            favouriteActionTitle = "No favorito"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil)*/
        
        
        
    }
    
    
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
    
    
    
}

