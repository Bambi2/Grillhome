//
//  HomeViewModel.swift
//  Grillhome
//
//  Created by Евгений Григорьян on 11.05.2021.
//  Copyright © 2021 Евгений Григорьян. All rights reserved.
//

import SwiftUI
import Firebase


class HomeViewModel: ObservableObject {
    
    @Published var sliderItems: [SliderItem] = []
    @Published var productTypes: [ProductType] = []
    @Published var products: [Product] = []
    @Published var cartItems: [Cart] = []
    @Published var filtered: [Product] = []
    @Published var cartSum: Int = 0
    
    @Published var address: String = ""
    @Published var phoneNumber: String = ""
    @Published var userName: String = ""
    //    public var sliderImages: [UIImage] = []
    
    
    
    
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
    @Published var selectedProductType: ProductType? = nil
    @Published var isCheckingOutShowing: Bool = false
    @Published var isOrdered: Bool = false
    @Published var search: String = ""
    
    init () {
        self.fetchData()
    }
    
    
    
    private func fetchData() {
        let db = Firestore.firestore()
        
        db.collection("SliderImages").getDocuments { snap, err in
            
            guard err == nil else { return }
            
            self.sliderItems = snap!.documents.compactMap { doc -> SliderItem in
                let id = doc.documentID
                let image = doc.get("image") as! String
                
                return SliderItem(id: id, imageURLString: image)
            }
            //            self.fetchSliderImages()
        }
        
        db.collection("ProductType").getDocuments { snap, err in
            
            guard err == nil else { return }
            
            self.productTypes = snap!.documents.compactMap { doc -> ProductType in
                let id = doc.get("id") as! Int
                let image = doc.get("image") as! String
                let type = doc.get("type") as! String
                let title = doc.get("title") as! String
                
                
                return ProductType(id: id, image: image, type: type, title: title)
            }
        }
        
        db.collection("Products").getDocuments { snap, err in
            guard err == nil else { return }
            
            self.products = snap!.documents.compactMap { doc -> Product in
                let id = doc.get("id") as! Int
                let image = doc.get("image") as! String
                let isAvailable = doc.get("isAvailable") as! Bool
                let name = doc.get("name") as! String
                let price = doc.get("price") as! Int
                let type = doc.get("type") as! String
                
                return Product(id: id, image: image, price: price, name: name, type: type, isAvailable: isAvailable)
                
            }
        }
        
    }
    
    func makeOrder() {
        let db = Firestore.firestore()
        
        var details: [[String : Any]] = []
        
        self.cartItems.forEach { cartItem in
            details.append([
                "name" : cartItem.product.name,
                "quantity" : cartItem.quantity,
                "price" : cartItem.product.price
            ])
        }
        
        db.collection("Users").addDocument(data:
                                            ["address" : self.address,
                                             "name" : self.userName,
                                             "number" : self.phoneNumber,
                                             "products" : details
                                            ])
        
        self.isOrdered = true
        
        
    }
    
    
    
    func addToCart(product: Product) {
        let index = getIndex(product: product, isCartIndex: false)
        
        if !products[index].isAdded {
            self.products[index].isAdded = true
            self.cartItems.append(Cart(product: product, quantity: 1))
        }
        else {
            self.products[index].isAdded = false
            self.cartItems.remove(at: getIndex(product: product, isCartIndex: true))
        }
    }
    
    func getIndex(product: Product, isCartIndex: Bool) -> Int {
        let index = self.products.firstIndex { item in
            return product.id == item.id
        } ?? 0
        
        let cartIndex = self.cartItems.firstIndex { item in
            return product.id == item.product.id
        } ?? 0
        
        return isCartIndex ? cartIndex : index
    }
    
    func calculateCartPrice() -> String {
        var cartSum: Int = 0
        
        for cartItem in self.cartItems {
            cartSum += cartItem.product.price * cartItem.quantity
        }
        
        return String(cartSum)
    }
    
    func increaseQuantity(of cartItem: Cart) {
        let index = getIndex(product: cartItem.product, isCartIndex: true)
        
        self.cartItems[index].quantity += 1
    }
    
    func decreaseQuantity(of cartItem: Cart) {
        let index = getIndex(product: cartItem.product, isCartIndex: true)
        
        if self.cartItems[index].quantity > 1 {
            self.cartItems[index].quantity -= 1
        }
        
        return
    }
    
    func searchData() {
        self.filtered = self.products.filter { product in
            return product.name.lowercased().contains(self.search.lowercased())
        }
    }
    
    //    private func fetchSliderImages() {
    //
    //        for item in sliderItems {
    //            guard let url = URL(string: item.imageURLString) else { self.sliderImages.append(UIImage(contentsOfFile: "icon")!); return }
    //
    //            let getDatatask = URLSession.shared.dataTask(with: url) { data, _, error in
    //                guard let data = data, error == nil else { return }
    //
    //                DispatchQueue.main.async {
    //                    let image = UIImage(data: data)
    //                    self.sliderImages.append(image!)
    //                }
    //            }
    //            getDatatask.resume()
    //        }
    //    }
    //}
    
    //func getSliderImage(url: String) -> UIImage{
    //
    //}
    
    
    
    
    //extension SliderItem {
    //    var image: UIImage? {
    //        var image: UIImage?
    //        guard let url = URL(string: imageURLString) else { return UIImage(ciImage: .white)}
    //
    //        let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in
    //            guard let data = data, error != nil else { return }
    //
    //            DispatchQueue.main.async {
    //                let file = UIImage(data: data)
    //                image = file
    //            }
    //        }
    //
    //        getDataTask.resume()
    //
    //        return image
    //
    //    }
    //}
    
}
