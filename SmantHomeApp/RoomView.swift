//
//  RoomView.swift
//  SmantHomeApp
//
//  Created by ashutosh on 04/06/21.
//

import SwiftUI

struct RoomView: View {
    @State private var onFullOverLayClicked = false
    @Binding var room : Room
    @Binding var onBackClicked :Bool
    var body: some View {
        ZStack(alignment:.topLeading){
            Image(room.imageName)
                        .resizable()
                
                .frame(width: !onBackClicked ? Screen.maxWidth*0.47 : Screen.maxWidth,height :!onBackClicked ? Screen.maxHeight*0.27 : Screen.maxHeight, alignment: .center)
                .animation(.linear)
                .scaledToFill()
            VStack(alignment:.leading){
            ZStack{
                Blur()
                    .frame(width: Screen.maxWidth*0.12, height: Screen.maxWidth*0.12, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 17))
                .opacity(0.8).shadow(radius: 10)
                Image(systemName: "chevron.backward.2").foregroundColor(.white)
            }
            .onTapGesture {
                onBackClicked = false
            }
                Text(room.roomType).bold().foregroundColor(.white).font(.title).padding(.top)
                HStack(spacing:15){
                    ZStack{
                        Blur().frame(width: Screen.maxWidth*0.12, height: Screen.maxWidth*0.12, alignment: .center).cornerRadius(17)
                        Image("setting").resizable().frame(width: Screen.maxWidth*0.06, height: Screen.maxWidth*0.06, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 17).frame(width: Screen.maxWidth*0.12, height: Screen.maxWidth*0.12, alignment: .center)
                        Image(systemName: "video").resizable().frame(width: Screen.maxWidth*0.06, height: Screen.maxWidth*0.05, alignment: .center)
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(15))
                        
                    }.foregroundColor(.lightPurple)
                }
            } .offset(x:Screen.maxWidth*0.05,y:Screen.maxWidth*0.1)
        }
       
        .overlay(
            RoomOverlayView(room: $room, onFullOverLayClicked: $onFullOverLayClicked)
                .cornerRadius(50)
                .offset(y:onFullOverLayClicked ? Screen.maxHeight*0.05 : Screen.maxHeight/2)
        )
       
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(room: .constant(Room( imageName: "kitchen", roomType: "KITCHEN", connectedDevice: 4, temp: 23)), onBackClicked: .constant(true))
    }
}
