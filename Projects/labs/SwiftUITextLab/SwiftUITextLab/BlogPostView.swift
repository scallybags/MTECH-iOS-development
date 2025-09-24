//
//  BlogPostView.swift
//  SwiftUITextLab
//
//  Created by Andrew Vanderwilt on 9/23/25.
//

import SwiftUI

struct BlogPostView: View {
    var body: some View {
        Text("Blog post view")
            .font(.system(size: 15))
        
        Text("Cabbage: The Overlooked Superfood You Need to Try")
            .font(.custom("Mishafi", size: 15))
            .foregroundStyle(.blue)
        
        Text("Sep 23")
            .foregroundStyle(.gray)
        
        Text("Cabbage might not get as much love as other leafy greens, but this humble veggie is a nutritional powerhouse with tons of health benefits. From its versatility in the kitchen to its impressive nutrient profile, cabbage deserves a spot in your regular diet. Cabbage is loaded with essential vitamins like Vitamin C, Vitamin K, and folate. It's also high in fiber, which supports digestion and helps you feel full longer. Anti-inflammatory & Antioxidants Cabbage contains antioxidants and compounds that fight inflammation, reducing the risk of chronic diseases like heart disease and cancer. Low Calorie, Great for Weight Loss. Cabbage is low in calories and high in fiber, making it a great choice for weight management. It’s filling but won’t contribute to excess calorie intake. Different Types of Cabbage Green Cabbage: The classic, mild-flavored variety, perfect for slaw and soups. Red Cabbage: Slightly sweeter and peppery, ideal for salads and pickling. Savoy Cabbage: Milder and sweeter, great for wraps or sautéing. Napa Cabbage: Delicate and tender, perfect for stir-fries or kimchi. How to Enjoy Cabbage. Salads & Slaw: Shredded cabbage makes a great base for fresh salads or creamy slaw. Stuffed Cabbage Rolls: A classic dish where cabbage leaves are filled with rice or meat. Kimchi: This spicy, fermented cabbage is a tangy, gut-friendly addition to many meals. Stir-fries: Quick, easy, and delicious — cabbage holds up well in a stir-fry with other veggies and proteins. Health Benefits: Boosts Immune System: Thanks to its Vitamin C, cabbage helps strengthen your immune defenses. Promotes Heart Health: The fiber and potassium in cabbage support healthy blood pressure and cholesterol levels. Detoxifies the Body: Cabbage aids in liver detox and supports the body’s natural cleansing processes. Conclusion: Next time you’re at the store, don’t skip over the cabbage. This budget-friendly vegetable is full of nutrients and can be prepared in a variety of ways, from slaws and soups to stir-fries and fermented dishes. Embrace the versatility and health benefits of cabbage — your body will thank you!")
            .font(.custom("Kohinoor Gujarati", size: 10))
            .foregroundStyle(.mint)
        
        Text("likes: 1,000,000,000")
            .font(.custom("Didot", size: 10))
            .foregroundStyle(.gray)
        
        Text("comments: 10,586")
            .font(.custom("Didot", size: 10))
            .foregroundStyle(.gray)
        
    }
}

#Preview {
    BlogPostView()
}
