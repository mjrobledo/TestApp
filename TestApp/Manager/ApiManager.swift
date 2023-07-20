//
//
// ApiManager.swift
// TestApp
//
// Using Swift 5.0
//
// Created by Ing. Miguel de Jesús Robledo Vera on 19/07/23.
// Copyright (c) 2023 and Confidential to ___ORGANIZATIONNAME___ All rights reserved.
//


import Foundation

class ApiManager {
    func getListApps(completion: @escaping ( ([AppModel]) -> Void)) {
            let data = LocalManager.loadDataFromJSON()
            completion(data)
    }
}


class LocalManager {
   static func loadDataFromJSON() -> [AppModel] {
        do {
            if let archivoURL = Bundle.main.url(forResource: "Data", withExtension: "json") {
                let datos = try Data(contentsOf: archivoURL)
                let decoder = JSONDecoder()
                let aplicacionesData = try decoder.decode(AppsList.self, from: datos)
                return aplicacionesData.apps
            } else {
                print("El archivo JSON no fue encontrado.")
                return []
            }
        } catch {
            print("Error al cargar y decodificar el JSON: \(error)")
            return []
        }
    }    
}
