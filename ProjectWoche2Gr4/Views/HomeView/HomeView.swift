import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var cartViewModel: CartViewModel
    @ObservedObject var productsViewModel: ProductsViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                BannerView(images: homeViewModel.images)
                CategoryView(categories: Category.allCases, selectedCategory: $homeViewModel.selectedCategory, filterByCategory: homeViewModel.filterByCategory)
                ProductGridView(columns: columns, products: homeViewModel.filteredProducts, productsViewModel: productsViewModel, cartViewModel: cartViewModel)
            }
            .toolbar {
                ToolbarItems(isSearchVisible: $homeViewModel.isSearchVisible, searchText: $homeViewModel.searchText, toggleSearch: { homeViewModel.isSearchVisible.toggle() })
            }
            .searchable(text: $homeViewModel.searchText, isPresented: $homeViewModel.isSearchVisible, placement: .automatic)
            .task {
                homeViewModel.getProducts()
            }
            .padding([.leading, .trailing])
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(repo: ProductsRepositoryImplementation()), cartViewModel: CartViewModel(), productsViewModel: ProductsViewModel(repo: ProductsRepositoryImplementation()))
    }
}
