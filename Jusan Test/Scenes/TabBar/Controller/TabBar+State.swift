//
//  TabBar+State.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

extension TabBarViewController {
    
    public enum State {
        case initial
    }
    
    public func updateState() {
        switch state {
        case .initial:
            configureTabBar()
        }
    }
    
}
