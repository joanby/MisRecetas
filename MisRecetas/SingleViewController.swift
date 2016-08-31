//
//  SingleViewController.swift
//  MisRecetas
//
//  Created by Juan Gabriel Gomila Salas on 6/7/16.
//  Copyright © 2016 Juan Gabriel Gomila Salas. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var recipes : [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*self.tableView.dataSource = self
        self.tableView.delegate = self*/
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
}


extension SingleViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipeCell
        cell.recipeImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        
        
        return cell
    }
}
