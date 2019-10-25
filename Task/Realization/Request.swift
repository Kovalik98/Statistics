//
//  Request.swift
//  Task
//
//  Created by Nazar Kovalik on 14.9.2019.
//  Copyright © 2019 Nazar Kovalik. All rights reserved.
//

import Foundation
        func request(){
        let tvc = TableViewController()
        let url = URL(string:"https://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/bradforddata.txt")!
         let task = URLSession.shared.dataTask(with:url) { (data, response, error) in
         if error != nil {
         print(error!)
                         }
        else {
            if let textFile = String(data: data!, encoding: .utf8) {
                                    text = textFile.components(separatedBy: "\n")
                                   text.removeSubrange(0...6)
                                   for i in 0...text.count - 1{
                                       let textRozpodil = text[i].components(separatedBy: " ")
                                       textArray.append(StructArray.init(years: textRozpodil[3], tmax: textRozpodil[9] + textRozpodil[10] + textRozpodil[11], tmin: textRozpodil[13] + textRozpodil[14] + textRozpodil[15], month: textRozpodil[6] + textRozpodil[5]))
                                   }
                            }
                         }
             
                     }
                     task.resume()
            DispatchQueue.main.async {
                              tvc.tableView.reloadData()
                          }
                    }

