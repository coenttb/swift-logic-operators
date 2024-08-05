//
//  File.swift
//  swift-logic-operators
//
//  Created by Coen ten Thije Boonkkamp on 05/08/2024.
//

#if canImport(SwiftUI)
import SwiftUI

extension Bool?:@retroactive CaseIterable {
    public static let allCases: [Self] = [true, false, nil]
}

extension Bool? {
    public struct View<
        Label: SwiftUI.View,
        NilLabel: SwiftUI.View
    >: SwiftUI.View {
        var label: ()->Label
        var nilLabel: ()->NilLabel
        @Binding var isOn: Bool?

        public init(
            _ label: @escaping ()->Label,
            _ nilLabel: @escaping ()->NilLabel,
            isOn: Binding<Bool?>
        ) {
            self.label = label
            self.nilLabel = nilLabel
            self._isOn = isOn
        }
        
        public init(
            _ label: String,
            isOn: Binding<Bool?>
        )
        where
        Label == SwiftUI.Text,
        NilLabel == SwiftUI.Text
        {
            self.label = { Text(label) }
            self.nilLabel = { Text("nil") }
            self._isOn = isOn
        }
        
        public var body: some SwiftUI.View {
            
            if let _ = isOn {
                HStack {
                    Toggle(
                        isOn: $isOn.nonOptional.animation(),
                        label: label
                    )
                    Button {
                        isOn = nil
                    } label: {
                        Text("nil")
                    }

                }
            } else {
                Toggle(
                    isOn: $isOn.nonOptional.animation(),
                    label: label
                )
            }
        }
    }
}

extension Bool? {
    internal var nonOptional: Bool {
        get {
            self ?? false
        }
        set {
            self = .some(newValue)
        }
    }
}
#endif


