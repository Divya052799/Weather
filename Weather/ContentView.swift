//
//  ContentView.swift
//  Weather
//
//  Created by DIVYASHREE N R on 21/12/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var isNight = false
    var body: some View{
        ZStack{
            //Color(.blue)
            BackgroundView(isNight: isNight)
            VStack{
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 70)
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageView: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageView: "snowflake", temperature: 20)
                    WeatherDayView(dayOfWeek: "THU", imageView: "cloud.sun.rain.fill", temperature: 40)
                    WeatherDayView(dayOfWeek: "FRI", imageView: "cloud.heavyrain", temperature: 35)
                    WeatherDayView(dayOfWeek: "SAT", imageView: "cloud.moon", temperature: 30)
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .white, backgroundColor: .mint)
                }
                Spacer()
            }
    
        }
    }
    }

   

   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageView: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageView)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
     var isNight: Bool
    var body: some View {
      //  LinearGradient(gradient:Gradient(colors:[isNight ? .black : .blue, //isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, //endPoint: .bottomTrailing)
            //.edgesIgnoringSafeArea(.all)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}
struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

