//
//  Popup.swift
//  FuitMarket
//
//  Created by Limetree on 2024/05/13.
//

import SwiftUI

enum PopupStyle {
    case none
    case blur
    case dimmed
}
fileprivate struct Popup<Message: View>: ViewModifier {
    let size: CGSize?
    let style: PopupStyle
    let message: Message
    
    init(size: CGSize? = nil, style: PopupStyle = .none, message: Message) {
        self.size = size
        self.style = style
        self.message = message
    }
    func body(content: Content) -> some View {
        content
            .blur(radius: style == .blur ? 2 : 0)
            .overlay(Rectangle()
                .fill(Color.black.opacity(style == .dimmed ? 0.4 : 0)))
            .overlay(popupContent)
    }
    private var popupContent: some View {
        GeometryReader {
            VStack{self.message}
                .frame(width: self.size?.width ?? $0.size.width * 0.6, height: self.size?.height ?? $0.size.height * 0.25)
                .background(Color.primary.colorInvert())
                .cornerRadius(12)
                .shadow(color: .primaryShadow, radius: 15, x: 5, y: 5)
                .overlay(self.checkCircleMark, alignment: .top)
                .position(x: $0.size.width/2, y: $0.size.height/2)
        }
    }
    private var checkCircleMark: some View {
        Symbol("checkmark.circle.fill", color: .peach)
            .font(Font.system(size:60).weight(.semibold))
            .offset(x:0, y: -20)
    }
}

fileprivate struct PopupToggle: ViewModifier {
    @Binding var isPresented: Bool
    func body(content: Content) -> some View {
        content
            .disabled(isPresented)
            .onTapGesture { self.isPresented.toggle() }
    }
}

fileprivate struct PopupItem<Item: Identifiable>:ViewModifier {
    @Binding var item: Item?
    func body(content: Content) -> some View {
        content
            .disabled(item != nil)
            .onTapGesture { self.item = nil}
    }
}

extension View {
    func popup<Content: View> (
        isPresented: Binding<Bool>,
        size: CGSize? = nil,
        style: PopupStyle = .none,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if isPresented.wrappedValue {
            let popup = Popup(size: size, style: style, message: content())
            let popupToggle = PopupToggle(isPresented: isPresented)
            let modifiedContent = self.modifier(popup).modifier(popupToggle)
            return AnyView(modifiedContent)
        } else {
            return AnyView(self)
        }
    }
}

extension View {
    func popup<Content: View, Item: Identifiable> (
        item: Binding<Item?>,
        size: CGSize? = nil,
        style: PopupStyle = .none,
        @ViewBuilder content: (Item) -> Content
    ) -> some View {
        if let selectedItem = item.wrappedValue {
            let content = content(selectedItem)
            let popup = Popup(size: size, style: style, message: content)
            let popupItem = PopupItem(item: item)
            let modifiedContent = self.modifier(popup).modifier(popupItem)
            return AnyView(modifiedContent)
        } else {
            return AnyView(self)
        }
    }
}


//struct Popup_Previews: PreviewProvider {
//    static var previews: some View {
//        Popup()
//    }
//}
