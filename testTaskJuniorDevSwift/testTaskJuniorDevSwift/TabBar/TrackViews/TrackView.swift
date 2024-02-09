import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 54.9044, longitude: 52.3154)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct TrackView: View {
    var body: some View {
        VStack (alignment: .leading) {
            MapView()
                .frame(height: 390)
            Text("Tracking Number")
                .bold()
            HStack {
                Image("mapIcon1")
                Text("R-7458-4567-4434-5854")
                    .bold()
            }
            .foregroundColor(Color("MainColor"))
            Text("Package status")
                .foregroundColor(Color("gray2"))
            VStack (alignment: .leading) {
                HStack {
                    MapCheckBox(checkBox: "CheckboxSelected")
                    VStack (alignment: .leading) {
                        Text("Courier requested")
                            .foregroundColor(Color("gray2"))
                        Text("July 7 2022 08:00am")
                            .foregroundColor(Color("orange1"))
                    }
                }
                HStack {
                    MapCheckBox(checkBox: "CheckboxSelected")
                    MapCheckBox(checkBox: "Package ready for delivery")
                    VStack (alignment: .leading) {
                        Text("Courier requested")
                            .foregroundColor(Color("gray2"))
                        Text("July 7 2022 08:00am")
                            .foregroundColor(Color("orange1"))
                    }
                }
                HStack {
                    MapCheckBox(checkBox: "Checkbox")
                    MapCheckBox(checkBox: "Package in transit")
                    VStack (alignment: .leading) {
                        Text("Courier requested")
                            .foregroundColor(Color("gray2"))
                        Text("July 7 2022 08:00am")
                            .foregroundColor(Color("orange1"))
                    }
                }
                HStack {
                    MapCheckBox(checkBox: "CheckboxGray")
                    VStack (alignment: .leading) {
                        Text("Courier requested")
                            .foregroundColor(Color("gray2"))
                        Text("July 7 2022 08:00am")
                            .foregroundColor(Color("orange1"))
                    }
                }
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
