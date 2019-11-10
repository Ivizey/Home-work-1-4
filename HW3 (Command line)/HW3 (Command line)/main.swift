//
//  main.swift
//  HW3 (Command line)
//
//  Created by Pavel Bondar on 11/10/19.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import Foundation

import Foundation

//1*. Створіть retain cycle використовуючи тільки один клас.
 //ARC 1
 class Person {
     var name: String
     
     init(name: String) {
         self.name = name
         print("\(name) is init")
     }
     
     deinit {
         print("\(name) delited from memory")
     }
 }

 var ref: Person?
 var ref1: Person?
 var ref2: Person?
 ref = Person(name: "Petya")
 ref1 = ref
 ref2 = ref1

 ref = nil
 ref1 = nil
 
//2. Створіть retain cycle для об’єктів трьох різних класів. В вас має бути 3 класи, в кожному класі може бути тільки одна проперті, тип цієї проперті не може бути таким же як клас де вона об’явлена.

class Country {
    let name = "Ukraine"
    deinit {
        print("Country: \(#function)")
    }
}

class City {
    var country: Country?
    deinit {
        print("City: \(#function)")
    }
}

class Street {
    var city: City?
    deinit {
        print("Street: \(#function)")
    }
}

var ukraine = Country() //+1
var cherkassy = City() //+1
var street = Street() //+1

cherkassy.country = ukraine
street.city = cherkassy

