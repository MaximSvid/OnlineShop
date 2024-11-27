import SwiftUI

struct AppNavigation: View {
    @ObservedObject var authViewModel: AuthViewModel
    @StateObject private var homeViewModel = HomeViewModel(repo: ProductsRepositoryImplementation())
    @StateObject private var cartViewModel = CartViewModel()

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView(homeViewModel: homeViewModel, cartViewModel: cartViewModel)
            }

            Tab("Cart", systemImage: "cart.fill") {
                CartView(cartViewModel: cartViewModel)
            }
            .badge(cartViewModel.cartItems.count)

            Tab("Favorite", systemImage: "star.fill") {
                FavoriteView()
            }

            Tab("Setting", systemImage: "gearshape.fill") {
                SettingView(authViewModel: authViewModel)
            }
        }
    }
}

struct AppNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigation(authViewModel: AuthViewModel())
    }
}

