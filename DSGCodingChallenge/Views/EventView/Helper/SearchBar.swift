//
//  SearchBar.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/11/22.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    var placeholder: String
    @Binding var text: String
//    weak var delegate: SearchBarActionDelegate?
    
    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = placeholder
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
//        delegate?.didSearch(self)
        uiView.text = text
    }
    
    func textDidChange() -> Void {
        return
    }
}
