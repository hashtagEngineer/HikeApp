//
//  CardView.swift
//  HikeApp
//
//  Created by Rushikesh Suradkar on 25/07/23.
//

import SwiftUI

struct CardView: View {
    //MARK: PROPERTIES
    @State private var imageNumber : Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet : Bool = false
    
    //MARK: FUNCTIONS
    
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
            
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                VStack (alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight,.customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom))
                        Spacer()
                        
                        Button{
                            print("Button Pressed")
                            isShowingSheet.toggle()
                        }label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    
                    Text("Fun and Enjoyable Activities for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                //MARK: MAIN CONTENT
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1), value: imageNumber)
                    
                }
                //MARK: Footer
                Button{
                    //ACTION
                    randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors:[
                                    .customGreenLight,
                                    .customGreenMedium,
                                ],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                }
                .buttonStyle(GredinetButton())
            }
        }
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}


