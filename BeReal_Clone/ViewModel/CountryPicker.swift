//
//  CountryPicker.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 13/08/2023.
//

import SwiftUI
import CountryPicker

struct CountryPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = CountryPickerViewController

    let countryPicker = CountryPickerViewController()

    @Binding var country: Country?
    
    func makeUIViewController(context: Context) -> CountryPickerViewController {
        countryPicker.selectedCountry = "VN"
        countryPicker.delegate = context.coordinator
        return countryPicker
    }

    func updateUIViewController(_ uiViewController: CountryPickerViewController, context: Context) {
        //
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, CountryPickerDelegate {
        var parent: CountryPicker
        init(_ parent: CountryPicker) {
            self.parent = parent
        }
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
}
