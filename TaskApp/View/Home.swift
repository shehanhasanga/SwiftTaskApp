//
//  Home.swift
//  TaskApp
//
//  Created by shehan karunarathna on 2022-02-09.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel : TaskViewModel = TaskViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing:15){
                            ForEach(viewModel.currentWeek, id:\.self) { day in
                                VStack(spacing:10){
                                    Text(
                                        viewModel.extractDate(date: day, format:"dd" )
                                       )
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Text(
                                        viewModel.extractDate(date: day, format:"EEE" )
                                       )
                                        .font(.system(size: 14))
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(viewModel.isToday(date: day) ? 1 : 0)
                                }
                                .frame(width: 45, height: 90)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                               
                               
                            }
                        }
                        .padding(.horizontal)
                    }
                } header: {
                    headerView()
                }

            }
        }
    }
    
    func headerView() -> some View {
        HStack(spacing:10){
            VStack{
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                Text("Today")
                    .font(.largeTitle)
                    .bold()
            }
            .heading()
            
            Button{
                
            }label: {
                Image("face1")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 45, height: 45, alignment: .trailing)
                    .clipShape(Circle())
                
            }
        }
        .padding()
        .background(.white)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    func heading() -> some View {
        return self.frame(maxWidth:.infinity, alignment: .leading)
    }
    func headtrailing() -> some View {
        return self.frame(maxWidth:.infinity, alignment: .trailing)
    }
    func headcenter() -> some View {
        return self.frame(maxWidth:.infinity, alignment: .center)
    }
}
