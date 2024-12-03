


import SwiftUI

struct ProductCardView: View {
    @Environment(\.modelContext) private var context
    @ObservedObject var productsViewModel: ProductsViewModel
    @State private var isFavorite: Bool = false
    var product: Products
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack (alignment: .bottom) {
                
                AsyncImage (url: URL(string: product.image)) { image in
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
                        Text(product.title)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.bottom, 3)
                        
                        Text(product.descriptionProduct)
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
                            Text(String(format: "%.1f", product.rating.rate))
                                .font(.caption)
                                .foregroundColor(.black.opacity(0.8))
                                .padding(.bottom, 3)
                        }
                        
                        
                        Text(String(format: "$%.2f", product.price))
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.5))
                    }
                    
                }
                .padding(8)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Button(action: {
                product.isFavorite.toggle()
                if  product.isFavorite {
                    productsViewModel.addToFavorite(product: product, context: context)
                } else {
                    productsViewModel.removeFromFavorite(product: product, context: context)
                }
            }) {
                Image(systemName:  product.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .foregroundStyle( product.isFavorite ? .red : .black)
            }
            
            
        }
//        .onAppear {
//            product.isFavorite = productsViewModel.loadFavoriteStatus(product: product, context: context)
//        }
        
        //        .frame(width: 180, height: 250)
        .frame(maxWidth: 180, maxHeight: 250)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        //        .shadow(color: .gray, radius: 3)
    }
}


#Preview {
    //    ProductCardView(imageName: "image1", title: "Jacke Jack Wolfskin", description: "aasdfkl;jasdflkj ;lkasdfklj assdfsdfasdfasdf;ldkjflk;j lkasdf ", rating: "4.5", price: "$12.00")
}


