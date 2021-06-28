//
//  NewsTab+Section.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

extension NewsTabViewController {
    
    // MARK: - Section
    public struct Section {
        public enum Section {
            case section
        }
        public enum Row {
            case page(NewsPage)
        }
        
        public let section: Section
        public let rows: [Row]
    }
    
}
