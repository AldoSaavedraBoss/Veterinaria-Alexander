//
//  Citas+CoreDataProperties.swift
//  
//
//  Created by Mac10 on 08/12/21.
//
//

import Foundation
import CoreData


extension Citas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Citas> {
        return NSFetchRequest<Citas>(entityName: "Citas")
    }

    @NSManaged public var descripcion: String?
    @NSManaged public var nombre: String?

}
