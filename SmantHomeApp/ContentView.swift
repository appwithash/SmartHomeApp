//
//  ContentView.swift
//  SmantHomeApp
//
//  Created by ashutosh on 03/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTab = 1
    @State private var onRoomClicked = false
    var body: some View {
        VStack(spacing:0){
            Spacer()
            HomeScreenView(onRoomClicked: $onRoomClicked).frame( height: Screen.maxHeight*0.91, alignment: .center)
            BottomTabBar(currentTab: $currentTab).opacity(!onRoomClicked ? 1:0)
        
        }
    }
}

//MARK: - BottomTabbar

struct BottomTabBar : View {
    @Binding var currentTab : Int
    var body: some View{
        
        HStack(spacing:Screen.maxWidth/6){
            VStack(spacing:6){
                Image(systemName: "house.fill").resizable().frame(width: Screen.maxWidth*0.06, height: Screen.maxWidth*0.06, alignment: .center).foregroundColor(currentTab==1 ? Color("lightPurple"): Color.gray).onTapGesture {
                currentTab=1
            }
                Circle().frame(width: 6, height: 6, alignment: .center).foregroundColor(currentTab==1 ? Color("lightPurple") : Color.white)
                    .isHidden(currentTab==1 ? false : true)
            }.offset(y:currentTab==1 ? -8 : 0)
      
            VStack(spacing:6){
            Image(systemName: "magnifyingglass").resizable().frame(width: Screen.maxWidth*0.06, height: Screen.maxWidth*0.06, alignment: .center).foregroundColor(currentTab==2 ? Color("lightPurple") : Color.gray).onTapGesture {
                currentTab=2
            }
                Circle().frame(width: 6, height: 6, alignment: .center).foregroundColor(currentTab==2 ? Color("lightPurple") : Color.white)
                    .isHidden(currentTab==2 ? false : true)
        
            }.offset(y:currentTab==2 ? -8 : 0)
            VStack(spacing:6){
            Image(systemName: "calendar").resizable().frame(width: Screen.maxWidth*0.06, height: Screen.maxWidth*0.06, alignment: .center).foregroundColor(currentTab==3 ? Color("lightPurple") : Color.gray).onTapGesture {
                currentTab=3
            }
            Circle().frame(width: 6, height: 6, alignment: .center).foregroundColor(currentTab==3 ? Color("lightPurple") : Color.white)
                .isHidden(currentTab==3 ? false : true)
        }.offset(y:currentTab==3 ? -8 : 0)
          
            VStack(spacing:6){
            Image(systemName: "person.fill").resizable().frame(width: Screen.maxWidth*0.06, height: Screen.maxWidth*0.06, alignment: .center).foregroundColor(currentTab==4 ? Color("lightPurple") : Color.gray).onTapGesture {
                currentTab=4
            }
                Circle().frame(width: 6, height: 6, alignment: .center).foregroundColor(currentTab==4 ? Color("lightPurple") : Color.white)
                    .isHidden(currentTab==4 ? false : true)
            }.offset(y:currentTab==4 ? -8 : 0)
           
        }.frame(width:Screen.maxWidth,height: Screen.maxHeight*0.1, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
