import SwiftUI

struct SwopView: View {
    @State var isVertical: Bool = false
    
    @Namespace var namespace
    
    var body: some View {
        VStack {
            if isVertical {
                VStack {
                    content
                }
            } else {
                HStack {
                    content
                }
            }
        
            Button(action: {
                withAnimation {
                    isVertical.toggle()
                }
                
            }, label: {
                Text("swop views")
            })
        }
    }
    
    @ViewBuilder var content: some View {
        Group {
            Rectangle()
                .matchedGeometryEffect(id: "rectangle", in: namespace)
            Circle()
                .matchedGeometryEffect(id: "circle", in: namespace)
        }
    }
}

struct SwopView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwopView(isVertical: true)
            SwopView()
        }
    }
}
