//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Rushikesh Suradkar on 26/07/23.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination : String? = nil
    
    var body: some View {
        LabeledContent{
            
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            }
            else if (rowLinkLabel != nil && rowLinkDestination != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                
            }else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }label: {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    if rowIcon != "linkedin" {
                        Image(systemName: rowIcon)
                            .foregroundColor(.white)
                        .fontWeight(.semibold)
                    } else {
                        Image("linkedin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                           
                    }
                }
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            CustomListRowView(rowLabel: "Designer", rowIcon: "linkedin", rowContent: "Rushikesh Suradkar", rowTintColor: .pink)
        }
    }
}
