//
//  File.swift
//  swift-logic-operators
//
//  Created by Coen ten Thije Boonkkamp on 05/08/2024.
//

#if canImport(SwiftUI)
import SwiftUI
import Foundation

extension Bool? {
    public struct Picker<
        Content: SwiftUI.View,
        Label: SwiftUI.View
    >: SwiftUI.View {
        var content: (Bool?)->Content
        var label: ()->Label
        @Binding var isOn: Bool?

        public init(
            _ content: @escaping (Bool?)->Content,
            _ label: @escaping ()->Label,
            isOn: Binding<Bool?>
        ) {
            self.content = content
            self.label = label
            self._isOn = isOn
        }
        
        public init(
            _ label: String = "",
            isOn: Binding<Bool?>
        )
        where
        Content == SwiftUI.Text,
        Label == SwiftUI.Text
        {
            self = .init(
                {
                    switch $0 {
                    case .some(true):
                        SwiftUI.Text("true")
                    case .some(false):
                        SwiftUI.Text("false")
                    case .none:
                        SwiftUI.Text("nil")
                    }
                },
                { Text(label) },
                isOn: isOn
            )
        }
        
        public var body: some SwiftUI.View {
            
            SwiftUI.Picker(
                selection: $isOn,
                content: {
                    ForEach(
                        Bool?.allCases,
                        id: \.self,
                        content: self.content
                    )
                },
                label: {
                    Text("Label")
                }
            )
            
            
//            Picker(selection: $isOn) {
//                ForEach(Bool?.allCases, id: \.self) { element in
//                    label(element)
//                }
//            } label: {
//                Text("Bloop")
//            }.pickerStyle(.segmented)
//
//            
//            if let _ = isOn {
//                HStack {
//                    Toggle(
//                        isOn: $isOn.nonOptional.animation(),
//                        label: label
//                    )
//                    Button {
//                        isOn = nil
//                    } label: {
//                        Text("nil")
//                    }
//
//                }
//            } else {
//                Toggle(
//                    isOn: $isOn.nonOptional.animation(),
//                    label: label
//                )
//            }
        }
    }
}
#endif
