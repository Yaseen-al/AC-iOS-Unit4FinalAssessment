//
//  FileMangerHelper.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
class playerDataModel {
    //step one is to make your file name
    static let kPathName = "favouriteBooks.plist"
    //intiate your class as a single tone
    private init(){}
    static let shared = playerDataModel()
    //create your data storage and saving when you update it
    private var settingsList = [Settings]() {
        didSet {
            saveSettingsList()
            print(documentDirectory()) //to print the directory of your file
        }
    }
    //Assign your methods of creating your directory, make the file path, load your data from the file, save your data, get your data storage after it has been loaded
    //returns Documents directory path for the App
    func documentDirectory()->URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0] //the 0 is the document folder
    }
    //returns supplied path name in documents directory
    private func dataFilePath(pathName: String)->URL {
        return playerDataModel.shared.documentDirectory().appendingPathComponent(pathName)
    }
    //Load you need to load your data in the view didlOad in order to acces the stuff saved on the app if you didn't do that you will have it empty
    //what is happening in loading is just decoding what the list have
    func loadSettingsList(){
        //make your decoder
        let decoder = PropertyListDecoder()
        // make the path
        let path = dataFilePath(pathName: playerDataModel.kPathName)
        do {
            //try to get the raw data using the path
            let data = try Data.init(contentsOf: path)
            // convert the raw data to a specific type
            settingsList = try decoder.decode([Settings].self, from: data)
        } catch {print("decoder error: \(error.localizedDescription)")}
    }
    //Save (encode)
    func saveSettingsList(){
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(settingsList)
            try data.write(to: dataFilePath(pathName: playerDataModel.kPathName), options: .atomic)
        }
        catch {print("encoder error: \(error.localizedDescription)")}
    }
    //Read (get) after it has been loaded at the begining of the programe
    func getSettingsList() -> [Settings]{
        return settingsList
    }
    //Add
    func addSettingToList(setting: Settings) {
        settingsList.append(setting)
        
    }
    //Delete selected book from Favorite List
    func resetList(){
        settingsList.removeAll()
    }
    
}


