//
//  Home.swift
//  InstrumentPanel0412
//
//  Created by 张亚飞 on 2022/4/12.
//

import SwiftUI

struct Home: View {
    
    @State var progress: CGFloat = 0.5
    
    @State var currentMonth: String = "Jan"
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            HStack {
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                        .frame(width: 40, height: 40)
                        .background{
                            
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(.gray.opacity(0.4), lineWidth: 1)
                        }
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .rotationEffect(.init(degrees: -90))
                }

            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
            //mark custom gradient card
            VStack {
                
                Text("Save This Month")
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
                
                AnimatedNumberText(value: progress * 1299, font: .system(size: 35, weight: .black), isCurrency: true)
                    .foregroundColor(Color("Green"))
                    .padding(.top, 5)
                    .lineLimit(1)
                
                //Mark speedoMeter
                SpeedoMeter(progress: $progress)
            }
            .padding(.top, 50)
            .frame(maxWidth: .infinity)
            .frame(height: 340)
            .background {
                
                RoundedRectangle(cornerRadius: 45, style: .continuous)
                    .fill(
                    
                        LinearGradient(colors: [
                        
                            Color("LightGreen")
                                .opacity(0.4),
                            Color("LightGreen")
                                .opacity(0.2),
                            Color("LightGreen")
                                .opacity(0.1),
                        ] + Array(repeating: Color.clear, count: 5), startPoint: .topTrailing, endPoint: .bottomLeading)
                    )
            }
            .padding(.top, 15)
            .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 8) {
                            
                            //mark months scorller
                            ForEach(months, id: \.self) { month in
                                
                                Text(month)
                                    .font(.callout)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 15)
                                    .background{
                                        
                                        if currentMonth == month {
                                            
                                            Capsule()
                                                .fill(.black)
                                                .matchedGeometryEffect(id: "MONTH", in: animation)
                                        }
                                    }
                                    .onTapGesture {
                                        
                                        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0)) {
                                            
                                            currentMonth = month
                                            progress = progressArray[getIndex(month: month)]
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding()
                
                BottomContent()
            }
            .padding(.top, 30)
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, 15)
        .background{
            
            Color("BG")
                .ignoresSafeArea()
        }
        
    }
    
    @ViewBuilder
    func BottomContent() -> some View {
        
        VStack(spacing: 15) {
            
            ForEach(expenses) { expense in
                
                HStack(spacing: 12) {
                    
                    Image(expense.icon)
                        .resizable()
//                        .renderingMode(.template)
                        .cornerRadius(17.5)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                    
                    VStack (alignment: .leading, spacing: 8) {
                        
                        Text(expense.title)
                            .fontWeight(.bold)
                        
                        Text(expense.subTitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth:.infinity, alignment: .leading)
                    
                    Text(expense.amount)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                
            }
        }
    }
    
    
    func getIndex(month: String) -> Int {
        
        return months.firstIndex { value in
            return month == value
        } ?? 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
