import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel

    var body: some View {
        VStack {
            // Header
            HStack {
                Text("My Cart")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()

            // Cart Items
            ForEach(viewModel.cartItems) { item in
                HStack {
                    AsyncImage(url: URL(string: item.product.image)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                    } placeholder: {
                        Color.gray.frame(width: 80, height: 80)
                    }

                    VStack(alignment: .leading) {
                        Text(item.product.title)
                            .font(.headline)
                        Text("$\(item.product.price, specifier: "%.2f")")
                            .font(.subheadline)
                    }
                    .padding(.leading, 10)

                    Spacer()

                    HStack {
                        Button(action: {
                            viewModel.removeItem(item.product)
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.black)
                        }
                        Text("\(item.quantity)")
                            .padding(.horizontal, 8)
                        Button(action: {
                            viewModel.addItem(item.product)
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            }

            Spacer()

            // Checkout Section
            VStack {
                HStack {
                    Text("Subtotal")
                    Spacer()
                    Text("$\(viewModel.total, specifier: "%.2f")")
                }
                HStack {
                    Text("Fee Delivery")
                    Spacer()
                    Text("$10.00")
                }
                HStack {
                    Text("Total Tax")
                    Spacer()
                    Text("$0.70")
                }
                Divider()
                HStack {
                    Text("Total")
                        .font(.headline)
                    Spacer()
                    Text("$\(viewModel.total + 10.70, specifier: "%.2f")")
                        .font(.headline)
                }

                Button(action: {
                    // Checkout action
                }) {
                    Text("Check Out")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
        }
        .background(Color.white)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}

