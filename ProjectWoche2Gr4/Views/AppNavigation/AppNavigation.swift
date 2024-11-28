import SwiftUI
import SwiftData

struct AppNavigation: View {
    @ObservedObject var authViewModel: AuthViewModel
    @StateObject private var homeViewModel = HomeViewModel(repo: ProductsRepositoryImplementation())
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject var productsViewModel: ProductsViewModel = ProductsViewModel(repo: ProductsRepositoryImplementation())

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView(homeViewModel: homeViewModel, cartViewModel: cartViewModel, productsViewModel: productsViewModel)
            }

            Tab("Cart", systemImage: "cart.fill") {
                CartView(cartViewModel: cartViewModel)
            }
            .badge(cartViewModel.cartItems.count)

            Tab("Favorite", systemImage: "star.fill") {
                FavoriteView(productsViewModel: productsViewModel)
            }

            Tab("Setting", systemImage: "gearshape.fill") {
                SettingView(authViewModel: authViewModel)
            }
        }
    }
}


#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Products.self, configurations: configuration)
    AppNavigation(authViewModel: AuthViewModel(), productsViewModel: ProductsViewModel(repo: ProductsRepositoryImplementation()))
        .modelContainer(for: [Products.self], inMemory: true)
}

//struct AppNavigation_Previews: PreviewProvider {
//    static var previews: some View {
//        AppNavigation(authViewModel: AuthViewModel(), productsViewModel: ProductsViewModel(repo: ProductsRepositoryImplementation()))
//            .modelContainer(for: [Products.self], inMemory: true)
//    }
//}

