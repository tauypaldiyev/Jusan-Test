//
//  News+Section.swift
//  Jusan Test
//
//  Created by Rauan on 29.06.2021.
//

extension NewsViewController {
    
    public struct Section {
        public enum Section {
            case section
        }
        public enum Row {
            case news
        }
        
        public var section: Section
        public var rows: [Row]
    }
    
}
