//
//  Images.swift
//  SlideshowApp
//
//  Created by Noboru Nishizawa on 2019/06/09.
//  Copyright © 2019 heuy.freeman. All rights reserved.
//

import Foundation
class Images {
    fileprivate var names: [String]
    init(names: [String]=[String]()){
        self.names = names;
        setNames()
    }
    func setNames(){
        for i in(1..<6){
            self.names.append("lop" + String(i) + ".png")
        }
    }
    func getArray() -> [String] {
        return self.names
    }
    func getName(_ index:Int) -> String {
        return self.names[index]
    }
}
