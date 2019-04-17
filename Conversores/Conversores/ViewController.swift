//
//  ViewController.swift
//  Conversores
//
//  Created by Leandro Roberto Medeiros on 09/04/19.
//  Copyright © 2019 Leandro Roberto Medeiros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textFieldValue: UITextField!
    @IBOutlet weak var buttonUnit1: UIButton!
    @IBOutlet weak var buttonUnit2: UIButton!
    @IBOutlet weak var labelResults: UILabel!
    @IBOutlet weak var labelResultsUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showNext(_ sender: UIButton) {
    
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            buttonUnit1.setTitle("Kilograma", for: .normal)
            buttonUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            buttonUnit1.setTitle("Real", for: .normal)
            buttonUnit2.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distância"
            buttonUnit1.setTitle("Metros", for: .normal)
            buttonUnit2.setTitle("Kilômetro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            buttonUnit1.setTitle("Celsius", for: .normal)
            buttonUnit2.setTitle("Fahrenheit", for: .normal)
        }
    
        convert(nil)
    
    }
    
    
    @IBAction func convert(_ sender: UIButton?) {
        
        if let sender = sender {
            if sender == buttonUnit1 {
                buttonUnit2.alpha = 0.5
            }else {
                buttonUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text! {
        
        case "Temperatura":
            calcTemperatura()
        case "Peso":
            calcPeso()
        case "Moeda":
            calcMoeda()
        default:
            calcDistancia()
            
        }
        
        view.endEditing(true)
        let resultado = Double(labelResults.text!)!
        labelResults.text = String(format: "%.2f", resultado)
   
    }
    
    func calcTemperatura(){
        guard let temperatura = Double(textFieldValue.text!) else {return}
        if buttonUnit1.alpha == 1.0 {
            labelResultsUnit.text = "Fahrenheit"
            labelResults.text = String(temperatura * 1.8 + 32.0)
        }else{
            labelResultsUnit.text = "Celsius"
            labelResults.text = String((temperatura * 32.0) / 1.8)
        }
    }
    
    func calcPeso() {
        guard let peso = Double(textFieldValue.text!) else {return}
        if buttonUnit1.alpha == 1.0 {
            labelResultsUnit.text = "Libra"
            labelResults.text = String(peso / 2.2046)
        }else{
            labelResults.text = "Kilograma"
            labelResults.text = String(peso * 2.2046)
        }
        
    }
    
    func calcMoeda(){
        guard let moeda = Double(textFieldValue.text!) else {return}
        if buttonUnit1.alpha == 1.0 {
            labelResultsUnit.text = "Dólar"
            labelResults.text = String(moeda / 3.5)
        }else{
            labelResultsUnit.text = "Real"
            labelResults.text = String(moeda * 3.5)
        }
        
    }
    
    func calcDistancia(){
        guard let distancia = Double(textFieldValue.text!) else {return}
        if buttonUnit1.alpha == 1.0 {
            labelResultsUnit.text = "Kilômetro"
            labelResults.text = String(distancia / 1000.0)
        }else{
            labelResultsUnit.text = "Metros"
            labelResults.text = String(distancia * 1000.0)
        }
        
    }
}

