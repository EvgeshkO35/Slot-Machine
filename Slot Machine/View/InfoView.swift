//
//  InfoView.swift
//  Slot Machine
//
//  Created by Evgenii Lysenko on 5/4/21.
//

import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    RowFormView(firstItem: "Application", secondItem: "Slot Machine")
                    RowFormView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    RowFormView(firstItem: "Developer", secondItem: "Evgenii Lysenko")
                    RowFormView(firstItem: "Designer", secondItem: "Robert Petras")
                    RowFormView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    RowFormView(firstItem: "Website", secondItem: "swiftuimasterclass.com")
                    RowFormView(firstItem: "Copyright", secondItem: "© 2020 All rights reserved.")
                    RowFormView(firstItem: "Version", secondItem: "1.0.0")
                } //: SECTION
            } //: FORM
        } //: VSTACK
        .font(.system(.body, design: .rounded))
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            } //: BUTTON
            .padding(.top, 20)
            .padding(.trailing, 10)
            .accentColor(.secondary)
            , alignment: .topTrailing
        )
        .onAppear(perform: {
            playSound(sound: "background-music", type: "mp3")
        })
    }
}

    
struct RowFormView: View {
    // MARK: - PROPERTIES
    
    var firstItem: String
    var secondItem: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

    // MARK: - PREVIEW

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewDevice("iPhone 11 Pro")
    }
}


