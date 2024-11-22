//
//  CardView.swift
//  Hike
//
//  Created by can on 21.11.2024.
//

import SwiftUI

struct CardView: View {
    //MARK: - Properties
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet = false
    
    //MARK: - Functions
    
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - Header
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        Spacer()
                        Button {
                            //ACTION: Show a sheet
                            print("pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                //MARK: - Main Content
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeInOut(duration: 0.5), value: imageNumber)
                    
                }
              //MARK: - Footer
                Button {
                    //Action: Generate number
                    randomImage()
                    
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
        
    }
}

#Preview {
    CardView()
}
