//
//  Settings.swift
//  HikeApp
//
//  Created by Rushikesh Suradkar on 26/07/23.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    "AppIcon-Campfire"
    ]
    var body: some View {
        List() {
            //MARK: SECTION HEADER
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("HIKE")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                    
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight,.customGreenMedium,.customGreenDark], startPoint: .top, endPoint:.bottom
                    ))
                .padding(.top, 8)
                
                VStack(spacing: 8){
                    Text("Where you can find \nperfect tracks ?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hikes whgich gorgeous in photos but is even better once yiu actually there. The hike that yoo hope to do again someday. \nFind the best day hikeks in th app.")
                        .font(.footnote)
                        .italic()
                    
                    Text( "Dust off the boots! Its time for a walk")
                        .foregroundColor(.customGreenMedium)
                        .fontWeight(.heavy)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            //MARK: SECTION ICONS
            
            Section(header: Text("Alternat App Icons")){
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack (spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button{
                                print(alternateAppIcons[item])
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                                    if error != nil {
                                        print("Failed request to update the app icon :\(String(describing: error?.localizedDescription))")
                                                                                         }else{
                                            print("Success! You have changed app icon to \(alternateAppIcons[item])")
                                        }
                                                                                         
                                                                            
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                        }.buttonStyle(.borderless)
                        }
                    }
                }.padding(.top, 12)
                
                Text("Choose you favourite app icons from collection above.")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            }
            .listRowSeparator(.hidden)
            
            //MARK: SECTION ABOUT
            Section(
            header: Text("About The app"),
            footer: HStack{
                Spacer()
                Text(" Copyrights © All right reserved.")
                Spacer()
            }
                .padding(.vertical,8)
            ){
                // Basic Label Content
              //  LabeledContent("Application", value: "Hike")
                //Advance Labeld Content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Comptability", rowIcon: "apps.iphone", rowContent: "iOS,iPad", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "SWIFT", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Rushikesh Suradkar", rowTintColor: .mint)
                CustomListRowView(rowLabel: "LinkedIn", rowIcon: "linkedin", rowTintColor: .white, rowLinkLabel:"Rushikesh Suradkar",rowLinkDestination: "https://www.linkedin.com/in/rushikesh-suradkar/")
            }
                
        } //: LIST
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
