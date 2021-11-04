//
//  CheckoutView.swift
//  MyRestaurant
//
//  Created by Admin on 04.11.2021.
//

import SwiftUI


struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType="Cash"
    @State private var addLoyaltyDetails=false
    @State private var loyaltyNumber = ""
    let tipsAmounts=[10,15,20,25,0]
    @State private var tipAmount=15
    @State private var showingPaymentAlert=false
    
    
    let paymentTypes=["Cash","Credit Card","iDine Points"]
    
    var totalPrice: String{
        let formatter=NumberFormatter()
        formatter.numberStyle = .currency
        
        let total=Double(order.total)
        let tipValue=total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ??
        "$0"
        
    }
    
    var body: some View{
        Form{
            Section{
                Picker("How do you want to pay?",selection:
                        $paymentType){
                    ForEach(paymentTypes,id: \.self){
                        Text($0)
                    }
                }
            }
            Toggle(
            "Add iDine Loyalty card",
                isOn:$addLoyaltyDetails.animation()
            )
            if addLoyaltyDetails{
                TextField("Enter your iDine ID",
                      text: $loyaltyNumber)
            
        }
            
            Section(header: Text("Add a tip?")){
                Picker("Percentage:",selection: $tipAmount){
                    ForEach(tipsAmounts,id: \.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total: $100")){
                Button("Confirm order"){
                    
                }
            }
            
            /*.alert(isPresented: $showingPaymentAlert){
                
            }*/
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct CheckoutView_Previews: PreviewProvider{
    static var previews: some View{
        CheckoutView().environmentObject(Order())
    }
}




