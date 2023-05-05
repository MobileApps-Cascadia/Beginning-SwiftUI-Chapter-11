import SwiftUI
import MapKit

struct MapExerciseView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    @State private var annotation: MKPointAnnotation?
    @State private var mapView: MKMapView?

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(coordinateRegion: $region, annotation: annotation, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .onEnded { gesture in
                            guard let mapView = mapView else { return }
                            let location = gesture.location
                            let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = coordinate
                            self.annotation = annotation
                        }
                )



            Compass()
                .frame(width: 50, height: 50)
                .padding(.trailing)
                .padding(.top)
        }
    }
}

struct Map: UIViewRepresentable {
    @Binding var coordinateRegion: MKCoordinateRegion
    var annotation: MKPointAnnotation?
    var showsUserLocation: Bool

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = showsUserLocation
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.setRegion(coordinateRegion, animated: true)

        if let annotation = annotation {
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotation(annotation)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: Map

        init(_ parent: Map) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Annotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }
            return annotationView
        }
    }
}


struct Compass: UIViewRepresentable {
    func makeUIView(context: Context) -> MKCompassButton {
        let compass = MKCompassButton(mapView: MKMapView())
        compass.compassVisibility = .adaptive
        return compass
    }

    func updateUIView(_ uiView: MKCompassButton, context: Context) {
        // No need to update anything here
    }
}

struct MapExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        MapExerciseView()
    }
}
