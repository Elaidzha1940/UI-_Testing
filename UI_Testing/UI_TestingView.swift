//  /*
//
//  Project: UI_Testing
//  File: UI_TestingView.swift
//  Created by: Elaidzha Shchukin
//  Date: 09.12.2023
//
//  */

import SwiftUI

// UI Test
/*
 1. UI Tests
 - tests the UI of the app
 
 2. Unit Tests
 - tests the business logic in the app
 */

class UITestingViewModel: ObservableObject {
    let placeholderText: String = "Add an item..."
    @Published var textField: String = ""
    @Published var currentItemisSaved: Bool = false
    
    func saveButtonPressed() {
        guard !textField.isEmpty else { return }
        currentItemisSaved = true
    }
}

struct UI_TestingView: View {
    @StateObject private var vm = UITestingViewModel()
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color.white, Color.black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            ZStack {
                if vm.currentItemisSaved {
                    Text("Hoo")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
                if !vm.currentItemisSaved {
                    saveLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                }
            }
        }
    }
}

#Preview {
    UI_TestingView()
}

extension UI_TestingView {
    private var saveLayer: some View {
        VStack {
            TextField(vm.placeholderText, text: $vm.textField)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding()
                .background(Color.white)
                .cornerRadius(15)
            
            Button(action: {
                withAnimation(.spring()) {
                    vm.saveButtonPressed()
                }
            }, label: {
                Text("Save")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(15)
            })
        }
        .padding()
    }
}
