import SwiftUI

struct CirclePicker: View {
    let items: [String] = ["first", "second", "third"]
    let size: CGFloat = 15
    let selectedSize: CGFloat = 20
    
    @Namespace private var namespace
    
    @State private var selection: String = "first"
    
    var body: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                HStack {
                    Circle().stroke(item == selection ? Color.accentColor :  Color.gray)
                        .frame(width: item == selection ? selectedSize : size,
                               height: item == selection ? selectedSize : size)
                        .matchedGeometryEffect(id: item, in: namespace, properties: .frame, isSource: true)
                    
                    Text(item)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        selection = item
                    }
                }
            }.background(
                Circle()
                    .fill(Color.accentColor)
                    .matchedGeometryEffect(id: selection, in: namespace, properties: .frame, isSource: false)
                    .frame(width: 20, height: 20)
            )
        }
    }
}

struct CirclePicker_Previews: PreviewProvider {
    static var previews: some View {
        CirclePicker()
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
