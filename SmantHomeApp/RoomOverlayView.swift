//
//  SwiftUIView.swift
//  SmantHomeApp
//
//  Created by ashutosh on 04/06/21.
//

import SwiftUI

struct RoomOverlayView: View {
    @Binding var room : Room
    @Binding var onFullOverLayClicked : Bool
    @State var isTempChange = true
    @State var isLightChange = false
    @State var isWifiOn = true
    @State var isSmartTvOn = false
    @State var activeDevices = 2
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack(spacing:25){
                Capsule().frame(width: Screen.maxWidth*0.12, height: Screen.maxWidth*0.01, alignment: .center).foregroundColor(.grey)
                    .onTapGesture {
                        onFullOverLayClicked.toggle()
                    }
            HStack(spacing:4){
                Spacer()
                Text("\(room.connectedDevice)  Devices").font(.title2).bold()
                Text("•").font(.title).foregroundColor(.grey)
                Text("\(activeDevices) active").font(.title3).foregroundColor(.lightPurple)
                Spacer()
                Spacer()
                ZStack{
                    Color.lightPurple.frame(width: Screen.maxWidth*0.1, height: Screen.maxWidth*0.1, alignment: .center)
                        .cornerRadius(10)
                    Image(systemName: "plus").resizable().frame(width: Screen.maxWidth*0.05, height: Screen.maxWidth*0.05, alignment: .center).foregroundColor(.white)
                }
                Spacer()
            }
                HStack(spacing: Screen.maxWidth*0.05){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).foregroundColor(isTempChange ? .lightPurple : .grey).frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.4, alignment: .center)
                            .cornerRadius(25)
                        HStack(spacing:20){
                            VStack(alignment:.leading){
                                Image(systemName: "thermometer").resizable().frame(width: Screen.maxWidth*0.08, height: Screen.maxWidth*0.1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(!isTempChange ? .lightPurple : .white)
                                Text("Temp").font(.title3).foregroundColor( .white)
                                Text(isTempChange ? "On" : "off").foregroundColor(.white)
                            }
                            VStack{
                                ZStack{
                                    Capsule().stroke().frame(width: 55, height: 30, alignment: .center).foregroundColor(.white)
                                    Circle().frame(width: 25, height: 25, alignment: .center).foregroundColor(.white)
                                        .offset(x: isTempChange ? 12 : -12)
                                        .animation(.easeIn)
                                   
                                }.onTapGesture {
                                    isTempChange.toggle()
                                    if(isTempChange){
                                        activeDevices+=1
                                    }else{
                                        activeDevices-=1
                                    }
                                }
                                .offset(y: -30.0)
                            }
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).foregroundColor(isLightChange ? .lightPurple : .grey).frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.4, alignment: .center)
                            .cornerRadius(25)
                        HStack(spacing:20){
                            VStack(alignment:.leading){
                                Image(systemName: "lightbulb").resizable().frame(width: Screen.maxWidth*0.08, height: Screen.maxWidth*0.1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(isLightChange ?  .white : .lightPurple)
                                Text("Light").font(.title3).foregroundColor( .white)
                                Text(isLightChange ? "On" : "off").foregroundColor(.white)
                            }
                            VStack{
                                ZStack{
                                    Capsule().stroke().frame(width: 55, height: 30, alignment: .center).foregroundColor(.white)
                                    Circle().frame(width: 25, height: 25, alignment: .center).foregroundColor(.white)
                                        .offset(x: isLightChange ? 12 : -12)
                                        .animation(.easeIn)
                                   
                                }.onTapGesture {
                                    isLightChange.toggle()
                                    if(isLightChange){
                                        activeDevices+=1
                                    }else{
                                        activeDevices-=1
                                    }
                                }
                                .offset(y: -30.0)
                            }
                        }
                        
                    }
                }
                
                HStack(spacing: Screen.maxWidth*0.05){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).foregroundColor(isSmartTvOn ? .lightPurple : .grey).frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.4, alignment: .center)
                            .cornerRadius(25)
                        HStack(spacing:0){
                            VStack(alignment:.leading){
                                Image(systemName: "tv").resizable().frame(width: Screen.maxWidth*0.1, height: Screen.maxWidth*0.1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(isSmartTvOn ? .white : .lightPurple )
                                Text("Smart TV").font(.title3).foregroundColor( .white)
                                Text(isSmartTvOn ? "On" : "off").foregroundColor(.white)
                            }
                            VStack{
                                ZStack{
                                    Capsule().stroke().frame(width: 55, height: 30, alignment: .center).foregroundColor(.white)
                                    Circle().frame(width: 25, height: 25, alignment: .center).foregroundColor(.white)
                                        .offset(x: isSmartTvOn ? 12 : -12)
                                        .animation(.easeIn)
                                   
                                }.onTapGesture {
                                    isSmartTvOn.toggle()
                                    if(isSmartTvOn){
                                        activeDevices+=1
                                    }else{
                                        activeDevices-=1
                                    }
                                }
                                .offset(y: -30.0)
                            }
                        }
                        
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0).foregroundColor(isWifiOn ? .lightPurple : .grey).frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.4, alignment: .center)
                            .cornerRadius(25)
                        HStack(spacing:20){
                            VStack(alignment:.leading){
                                Image(systemName: isWifiOn ? "wifi" : "wifi.slash").resizable().frame(width: Screen.maxWidth*0.1, height: Screen.maxWidth*0.1, alignment: .center).foregroundColor(isWifiOn ? .white : .lightPurple )
                                Text("Temp").font(.title3).foregroundColor( .white)
                                Text(isWifiOn ? "On" : "off").foregroundColor(.white)
                            }
                            VStack{
                                ZStack{
                                    Capsule().stroke().frame(width: 55, height: 30, alignment: .center).foregroundColor(.white)
                                    Circle().frame(width: 25, height: 25, alignment: .center).foregroundColor(.white)
                                        .offset(x: isWifiOn ? 12 : -12)
                                        .animation(.easeIn)
                                   
                                }.onTapGesture {
                                    isWifiOn.toggle()
                                    if(isWifiOn){
                                        activeDevices+=1
                                    }else{
                                        activeDevices-=1
                                    }
                                }
                                .offset(y: -30.0)
                            }
                        }
                    }
                }
              
                Spacer()
            }.padding(.top)
        }.cornerRadius(10.0)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RoomOverlayView(room:.constant(Room( imageName: "kitchen", roomType: "kitchen", connectedDevice: 4, temp: 23)), onFullOverLayClicked: .constant(false))
    }
}
