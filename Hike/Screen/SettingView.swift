//
//  SettingView.swift
//  Hike
//
//  Created by can on 22.11.2024.
//

import SwiftUI

struct SettingView: View {
    private let alternateAppIcons : [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Campfire",
        "AppIcon-Backpack",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera"
    ]
    var body: some View {
        List{
            //MARK: - Section Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading").font(.system(size: 66, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike").font(.system(size: 66, weight: .black))
                        Text("Editor's Choice").fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing").font(.system(size: 66, weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                VStack (spacing: 8){
                    Text("Where can you find \nperfect tracks?").font(.title2).fontWeight(.heavy)
                    Text("The hike which look gorgeous in photos but is even better once you're there.The hike that you hope to do again someday. \nFind the best day hikes in the app.").font(.footnote).italic()
                     Text("Dust off the hiking boots and get ready for a new adventure!")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                    
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }//: Header
            .listRowSeparator(.hidden)
            //MARK: - Section Icons
            Section(header: Text ("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("failed\(String(describing: error?.localizedDescription))")
                                    }else {
                                        print("success")
                                    }
                                    
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }//: Scroll view
                .padding(.top, 12)
                Text("Choose your favorite icon.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }//: Section
            //MARK: - Section About
            Section (header: Text("ABOUT THE APP"),
                     footer: HStack {
                Spacer()
                Text("Copyright ® All rights reserved.")
                Spacer()
            }
                .padding(.vertical, 8)
            ){
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .red)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "go to link :)", rowLinkDestination: "https://hackertyper.net/")
                
                
                
            }//: Section
        }//: List
        
    }
}

#Preview {
    SettingView()
}
