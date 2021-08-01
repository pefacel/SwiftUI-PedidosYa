//
//  ContentView.swift
//  Listas y Navegación
//

import SwiftUI

struct ContentView: View {
  
    
    
  private let restaurantList: [RestaurantItem] = [
    RestaurantItem(
        nombre: "El beto",
        tiempoEnvio: "35-45 min",
        valorEnvio: "$800",
        envioDelLocal: true,
        patrocinado: true,
        favorito: false,
        rating: "4.5",
        logo: "el-beto"),
    RestaurantItem(
        nombre: "Starbucks",
        tiempoEnvio: "35-45 min",
        valorEnvio: "$1200",
        envioDelLocal: false,
        patrocinado: true,
        favorito: true,
        rating: "4.5",
        logo: "starbucks"),
    RestaurantItem(
        nombre: "Burger King",
        tiempoEnvio: "35-90 min",
        valorEnvio: "$800",
        envioDelLocal: true,
        patrocinado: false,
        favorito: true,
        rating: "4.5",
        logo: "burger-king"),
    RestaurantItem(
        nombre: "McDonalds",
        tiempoEnvio: "45-60 min",
        valorEnvio: "$1590",
        envioDelLocal: true,
        patrocinado: false,
        favorito: false,
        rating: "4.5",
        logo: "mcdonalds"),
    RestaurantItem(
        nombre: "subway",
        tiempoEnvio: "35-45 min",
        valorEnvio: "$1790",
        envioDelLocal: true,
        patrocinado: false,
        favorito: false,
        rating: "4.5",
        logo: "subway"),
  ]
  
  var body: some View {
    NavigationView {
      List(restaurantList) { restaurantItem in
        NavigationLink(destination: DetailsView(restaurantItem: restaurantItem)) {
          HStack {
            RestaurantListView(restaurant: restaurantItem)


          }.padding(7)
        }
      }
      .navigationBarTitle("Restaurantes")
    }
  }
}

struct DetailsView: View {

  let restaurantItem: RestaurantItem
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        RestaurantCircleView(restaurantItem: restaurantItem)
          .padding(.trailing, 5)
        
        Text(restaurantItem.nombre)
          .font(.largeTitle)
          .bold()
        
        Spacer()
      }
      
      Text(restaurantItem.tiempoEnvio)
        .padding(.top)
      
      Spacer()
    }
    .padding()
    .navigationBarTitle(Text(restaurantItem.nombre), displayMode: .inline)
  }
}

struct RestaurantCircleView: View {
  let restaurantItem: RestaurantItem
  
  var body: some View {
    ZStack {
      Text(restaurantItem.nombre)
        .shadow(radius: 3)
        .font(.largeTitle)
        .frame(width: 65, height: 65)
        .overlay(
          Circle().stroke(Color.purple, lineWidth: 3)
        )
    }
  }
}

struct RestaurantListView: View {
  let restaurant: RestaurantItem
  
  var body: some View {
    HStack
    {
        HStack
        {
            Image(restaurant.logo)
                .resizable()
                .frame(width: 70.0, height: 70.0)
                .scaledToFit()
            
            VStack(alignment: .leading)
            {
                restaurant.patrocinado ? Text("PATROCINADO")
                    .font(.caption2) : nil
                Text(restaurant.nombre)
                    .fontWeight(.semibold)
                restaurant.envioDelLocal ? Text("ENVÌO DEL LOCAL")
                    .font(.caption2)
                    .fontWeight(.black)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
                    .opacity(0.5)
                    : nil
                Text(restaurant.tiempoEnvio + "·" + "Envío " + restaurant.valorEnvio)
                    .font(.caption2)
            }
            
            HStack
            {
                restaurant.favorito ? Text("❤️")
                    .font(.caption2) : Text("♡")
                Text("✭ " + restaurant.rating)
                    .font(.caption)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                    .opacity(0.5)
            }
            .padding(.bottom)
        }
        
        
    }
    
    
  }
}

 

struct RestaurantItem: Identifiable {
    let id = UUID()
    let nombre: String
    let tiempoEnvio: String
    let valorEnvio: String
    let envioDelLocal: Bool
    let patrocinado: Bool
    let favorito: Bool
    let rating: String
    let logo: String
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
