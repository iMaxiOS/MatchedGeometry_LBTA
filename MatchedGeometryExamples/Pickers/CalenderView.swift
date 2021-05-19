import SwiftUI

struct CalenderView: View {
    @Namespace var namespace
    @State private var selection: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                ForEach(0..<12) {  monthID in
                    MonthView(month: monthID, selection: $selection)
                        .matchedGeometryEffect(id: monthID, in: namespace)
                }
            })
        }.background(
            RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 3)
                .matchedGeometryEffect(id: selection, in: namespace, isSource: false)
        )
    }
    
    struct MonthView: View {
        let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        let month: Int
        
        @Binding var selection: Int
        
        var body: some View {
            Text(monthNames[month])
                .fixedSize()
                .padding(10)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.40)) {
                        self.selection = month
                    }
                }
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
