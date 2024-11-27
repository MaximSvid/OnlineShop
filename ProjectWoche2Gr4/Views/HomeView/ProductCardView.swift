


import SwiftUI

struct ProductCardView: View {
//    @ObservedObject var homeViewModel:  HomeViewModel
    
    var imageName: String
    var title: String
    var description: String
    var rating: String
    var price: String
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack (alignment: .bottom) {
//                Image(imageName)
//                    .resizable()
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .frame(width: 180, height: 250)
//                    .scaledToFit()
                
                AsyncImage (url: URL(string: imageName)) { image in
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 180, height: 250)
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 180, height: 250)
                
                HStack() {
                    VStack (alignment: .leading) {
                        Text(title)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.bottom, 3)
                        
                        Text(description)
                            .font(.caption)
                            .foregroundColor(.black.opacity(0.8))
                    }
                    .frame(height: 50)

                    
                    Spacer()
                    
                    VStack (alignment: .trailing) {
                        
                        HStack {
  
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .font(.caption)
                            Text(rating)
                                .font(.caption)
                                .foregroundColor(.black.opacity(0.8))
                                .padding(.bottom, 3)
                        }
                        
                        
                        Text(price)
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.5))
                    }
                    
                }
                .padding(8)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
//            Button  {
//                homeViewModel.isLiked.toggle()
//            } label: {
//                Image(systemName: "heart.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 25, height: 25)
//                    .padding(10)
//                    .foregroundStyle(homeViewModel.isLiked ? .red : .black)
//            }
            
            
        }
//        .frame(width: 180, height: 250)
        .frame(maxWidth: 180, maxHeight: 250)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .shadow(color: .gray, radius: 3)
    }
}


#Preview {
    ProductCardView(imageName: "image1", title: "Jacke Jack Wolfskin", description: "aasdfkl;jasdflkj ;lkasdfklj assdfsdfasdfasdf;ldkjflk;j lkasdf ", rating: "4.5", price: "$12.00")
}


