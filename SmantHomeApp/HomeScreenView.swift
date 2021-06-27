//
//  HomeScreenView.swift
//  SmantHomeApp
//
//  Created by ashutosh on 03/06/21.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var currentState = 1
    @State private var room : Room = Room( imageName: "kitchen", roomType: "kitchen", connectedDevice: 4, temp: 23)
    @Binding  var onRoomClicked : Bool
    var body: some View {
        ZStack{
            VStack(alignment:.leading,spacing:20){
               
                HStack{
                    Spacer()
                    VStack(alignment:.leading){
                        Text("Good Morning,").font(.largeTitle)
                        Text("Ashutosh").bold().font(.title)
                    }.padding(.leading,Screen.maxWidth*0.018)
                    Spacer()
                    Spacer()
                    Image("profilePicture").resizable().scaledToFill().frame(width: Screen.maxWidth*0.2, height: Screen.maxWidth*0.2, alignment: .center).clipShape(Circle()).offset(y:-30)
                    Spacer()
                }
                Text("Current State").bold().font(.title2).padding(.leading,Screen.maxWidth*0.08)
                HStack(spacing:20){
                    ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.gray,lineWidth: currentState==1 ? 0 : 1)
                        .background(currentState==1 ? Color.lightPurple : Color.white).cornerRadius(25)
                        .frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.21, alignment: .center)
                        VStack(alignment:.leading){
                            Text("I'm Home").bold().foregroundColor(currentState==1 ? .white : .lightPurple)
                            Text("40% activity").font(.body).foregroundColor(currentState==1 ? .white : .grey)
                        }.padding(.trailing)
                    }.onTapGesture {
                        self.currentState=1
                    }
                        
                    ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.gray,lineWidth: currentState==2 ? 0 : 1)
                        .background(currentState==2 ? Color.lightPurple : Color.white).cornerRadius(25)
                        .frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.21, alignment: .center)
                        VStack(alignment:.leading){
                            Text("I'm Leaving").bold().foregroundColor(currentState==2 ? .white : .lightPurple)
                            Text("10% activity").font(.body).foregroundColor(currentState==2 ? .white : .grey)
                        }.padding(.trailing)
                        }.onTapGesture {
                            self.currentState=2
                        }
                    
                }.padding(.leading,Screen.maxWidth*0.08)
                HStack(spacing:20){
                    ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.gray,lineWidth: currentState==3 ? 0 : 1)
                        .background(currentState==3 ? Color.lightPurple : Color.white).cornerRadius(25)
                        .frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.21, alignment: .center)
                        VStack(alignment:.leading){
                            Text("I'm Sleeping").bold().foregroundColor(currentState==3 ? .white : .lightPurple)
                            Text("20% activity").font(.body).foregroundColor(currentState==3 ? .white : .grey)
                        }.padding(.trailing)
                    }.onTapGesture {
                        self.currentState=3
                    }
                    ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.gray,lineWidth: currentState==4 ? 0 : 1)
                        .background(currentState==4 ? Color.lightPurple : Color.white).cornerRadius(25)
                        .frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.21, alignment: .center)
                        VStack(alignment:.leading){
                            Text("Vacation").bold().foregroundColor(currentState==4 ? .white : .lightPurple)
                            Text("15% activity").font(.body).foregroundColor(currentState==4 ? .white : .grey)
                        }.padding(.trailing)
                    }.onTapGesture {
                        self.currentState=4
                    }
                }.padding(.leading,Screen.maxWidth*0.08)
                Text("Rooms").bold().font(.title2).padding(.leading,Screen.maxWidth*0.08).padding(.top)
                RoomSetUp(onRoomClicked:$onRoomClicked, room: $room)

     
    }
            
        }
        .frame(width: Screen.maxWidth, height: Screen.maxHeight*0.91, alignment: .center).padding(.top)
//        .overlay( Image(img)
//                    .resizable()
//                    .frame(width: onRoomClicked ? Screen.maxWidth : Screen.maxWidth*0.47,height :onRoomClicked ? Screen.maxHeight : Screen.maxHeight*0.27, alignment: .center)
//                    .animation(.easeIn)
//                    .foregroundColor(.blue)
//                    .cornerRadius(20.0).opacity(onRoomClicked ? 1 : 0)
//                  //  .offset(y:-Screen.maxHeight*0.21)
//                  , alignment: .center)
       
}
}


struct RoomSetUp : View{
    @Binding var onRoomClicked :Bool
    @Binding var room : Room
    @State private var overlayRoomImage : String = String()
    @State private var onTouch : CGPoint = CGPoint(x: 0, y: 0)
    var rooms : [Room] = [
        Room(imageName: "kitchen", roomType: "KITCHEN", connectedDevice: 5, temp: 20),
        Room(imageName: "bedroom3", roomType: "BEDROOM 1", connectedDevice: 3, temp: 27),
        Room(imageName: "bedroom1", roomType: "BEDROOM 2", connectedDevice: 2, temp: 30),
        Room(imageName: "bedroom2", roomType: "BEDROOM 3", connectedDevice: 6, temp: 25),
       
        Room(imageName: "bathroom", roomType: "BATHROOM", connectedDevice: 4, temp: 22),
        Room(imageName: "drawingroom", roomType: "LIVING ROOM", connectedDevice: 4,temp:25),
    ]
    
    var body: some View{
       
     
       
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing:Screen.maxWidth*0.08){
        ForEach(rooms){room in
           
            ForOneRoom(room: room, onRoomClicked: $onRoomClicked).onTapGesture {
              
           
             //   updateRoom(room: room)
            //    let x = location(room)
                onRoomClicked=true
                self.room = room
            //    print(room.imageName)
            }
            
                
            }
          
        }
        }.padding(.leading,Screen.maxWidth*0.08)
        .overlay( RoomView(room: self.$room, onBackClicked: $onRoomClicked)
                    .animation(.easeIn)
                    .foregroundColor(.blue)
                    .cornerRadius(20.0).opacity(onRoomClicked ? 1 : 0).offset(y:-Screen.maxHeight*0.21), alignment: .center)

       
    }
    
}

struct ForOneRoom : View {
    let room : Room
    @Binding var onRoomClicked : Bool
    var body: some View{
        ZStack(alignment:.bottomLeading){
            Image(room.imageName)
                .resizable()
                .frame(width: Screen.maxWidth*0.47,height :Screen.maxHeight*0.27, alignment: .center)
                .foregroundColor(.blue)
                .cornerRadius(20.0)
               
            VStack(alignment:.leading,spacing:5){
                HStack{
                    Spacer()
                ZStack{
                 
                    Blur()
                    .frame(width: Screen.maxWidth*0.15, height: Screen.maxWidth*0.1, alignment: .trailing).foregroundColor(.grey).cornerRadius(10).shadow(radius: 10)
                    
                    Text("\(room.temp)°C").bold().font(.system(size: 16)).foregroundColor(.white)
                }.offset(x: -Screen.maxWidth*0.06, y: -Screen.maxWidth*0.2)
                    
                }
                Text(room.roomType).font(.title3).bold().foregroundColor(.white).padding(.top)
                HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10.0).frame(width: Screen.maxWidth*0.07, height: Screen.maxWidth*0.07, alignment: .center)
                        .foregroundColor(.lightPurple)
                    Text(String(room.connectedDevice)).bold().font(.system(size: 16)).foregroundColor(.white)
                }
                    Text("devices").foregroundColor(.white).bold()
                }
                
            }.offset(x: Screen.maxWidth*0.03, y:-Screen.maxWidth*0.05)
        }
        .shadow(color: .grey, radius: 10)
//        .overlay( Image(room.imageName)
//                    .resizable()
//                    .frame(width: onRoomClicked ? Screen.maxWidth : Screen.maxWidth*0.47,height :onRoomClicked ? Screen.maxHeight : Screen.maxHeight*0.27, alignment: .center)
//                    .animation(.easeIn)
//                    .foregroundColor(.blue)
//                    .cornerRadius(20.0).opacity(onRoomClicked ? 1 : 1)
//                  //  .offset(y:-Screen.maxHeight*0.21)
//                  , alignment: .center)
    }
    
}

struct Room : Identifiable{
    var id = UUID()
    var imageName : String
    var roomType : String
    var connectedDevice : Int
    var temp : Int
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(onRoomClicked: .constant(false))
    }
}
