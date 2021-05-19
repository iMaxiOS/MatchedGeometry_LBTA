import SwiftUI

struct MatchFrameExample: View {
    let geometryId: String = "geometryId"
    
    @State private var isMatched: Bool = false
    
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                Text("Hello, World!")
                    .fixedSize()
                    .padding()
                    .border(Color.yellow)
                    .matchedGeometryEffect(
                        id: geometryId,
                        in: namespace,
                        properties: .size,
                        anchor: .center,
                        isSource: isMatched
                    )
                    .zIndex(1)
                    .onTapGesture {
                        withAnimation {
                            isMatched = true
                        }
                    }
                
                Text("Selection")
                    .matchedGeometryEffect(
                        id: geometryId,
                        in: namespace,
                        properties: .size,
                        anchor: .center,
                        isSource: !isMatched
                    )
                    .onTapGesture {
                        withAnimation {
                            isMatched = false
                        }
                    }
            }
            .padding()
            .background(
                Rectangle()
                    .fill(Color.red)
                    .matchedGeometryEffect(
                        id: geometryId,
                        in: namespace,
                        properties: .frame,
                        anchor: .center,
                        isSource: false
                    )
                    .zIndex(0)
                    .border(Color.pink, width: 2)
            )
            
            Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")
        }
    }
}

struct MatchFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        MatchFrameExample()
    }
}
