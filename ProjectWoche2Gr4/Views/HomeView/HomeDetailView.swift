import SwiftUI

struct HomeDetailView: View {
    @Environment(\.modelContext) private var context
    @State private var isFavorite: Bool = false
    @State private var selectedSize: Int? = 40
    var product: Products
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var productsViewModel: ProductsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Produktbild
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)
                    .padding(.horizontal)
            } placeholder: {
                Color.gray.frame(height: 300)
            }
            
            // Produktname, Preis und Bewertung
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Bewertung: Stern und Zahl (4.6)
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .imageScale(.small)
                        Text("\(product.rating.rate, specifier: "%.1f")")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
            
            // Produktbeschreibung
            VStack(alignment: .leading, spacing: 8) {
                Text(product.descriptionProduct)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Buttons: "Buy Now" und Warenkorb
            HStack {
                // "Buy Now" Button links
                NavigationLink(destination: CartView(cartViewModel: cartViewModel)) {
                    Text("Buy Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Warenkorb-Symbol rechts
                Button(action: {
                    cartViewModel.addItem(product)
                }) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding(.trailing)
            }
            .padding(.top, 16)
        }
        .padding(.vertical)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    product.isFavorite.toggle()
                    if product.isFavorite {
                        productsViewModel.addToFavorite(product: product, context: context)
                    } else {
                        productsViewModel.removeFromFavorite(product: product, context: context)
                    }
                }) {
                    Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(product.isFavorite ? .red : .black)
                }
            }
        }
    }
}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeDetailView(product: Products(id: 1, title: "Nike Basketball Shoes", price: 272.0, description: "They are a cross between the Air Force 1, the Air Jordan and the Nike Terminator. The first model came out in 1985 and was called Dunk in honour of the players' feats...", category: "Shoes", image: "https://example.com/image.jpg", rating: Rating(rate: 4.6, count: 120)), cartViewModel: CartViewModel(), productsViewModel: ProductsViewModel(repo: ProductsRepositoryImplementation()))
        }
    }
}
