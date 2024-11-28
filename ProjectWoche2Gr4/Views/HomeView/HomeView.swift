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
                await homeViewModel.getProducts()
            }
            .padding([.leading, .trailing])
        }
    }
}

// BannerView Component
struct BannerView: View {
    let images: [String]

    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .scaledToFit()
                    .frame(height: 290)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 150)
    }
}

// CategoryView Component
struct CategoryView: View {
    let categories: [Category]
    @Binding var selectedCategory: Category?
    let filterByCategory: () -> Void

    var body: some View {
        VStack {
            HStack {
                Text("Categories")
                    .font(.headline)
                Spacer()
            }

            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(categories, id: \.self) { category in
                        VStack(alignment: .leading) {
                            Image(systemName: category.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)

                            Text(category.title)
                                .font(.caption)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.1))
                        )
                        .onTapGesture {
                            if selectedCategory == category {
                                selectedCategory = nil
                            } else {
                                selectedCategory = category
                            }
                            filterByCategory()
                        }                        
                    }
                }
                .frame(height: 50)
            }
            .scrollIndicators(.hidden)
        }
    }
}

// ProductGridView Component
struct ProductGridView: View {
    let columns: [GridItem]
    let products: [Products]
    @ObservedObject var productsViewModel: ProductsViewModel
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        VStack {
            HStack {
                Text("All Goods")
                    .font(.headline)
                Spacer()
            }

            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(products) { product in
                    NavigationLink(destination: HomeDetailView(product: product, cartViewModel: cartViewModel)) {
                        ProductCardView(productsViewModel: productsViewModel, product: product)
                    }
                }
            }
        }
    }
}

// ToolbarItems Component
struct ToolbarItems: ToolbarContent {
    @Binding var isSearchVisible: Bool
    @Binding var searchText: String
    let toggleSearch: () -> Void

    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            Button {
                toggleSearch()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
            }
        }

        ToolbarItemGroup(placement: .navigationBarLeading) {
            Text("HomeView")
                .font(.title.bold())
                .foregroundStyle(.black)
        }
    }
}

// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(repo: ProductsRepositoryImplementation()), cartViewModel: CartViewModel(), productsViewModel: ProductsViewModel(repo: ProductsRepositoryImplementation()))
    }
}
