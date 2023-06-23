import SwiftUI
import Foundation
import CoreLocation
import Combine
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
//        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
//        if locationStatus == .authorizedWhenInUse  || locationStatus == .authorizedAlways {
//            locationManager.requestLocation()
//            
//        }
        guard let location = locations.last else { return }
        lastLocation = location
        fetchCountryAndCity(for: locations.last)
        print("oi")
//        print(#function, location)
    }
    
    func stop()
    {
        locationManager.stopUpdatingLocation()
    }
    
    func fetchCountryAndCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.currentPlacemark = placemarks?.first
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocationAlways() {
        locationManager.requestAlwaysAuthorization()
    }
    
}


struct LocationTestView: View {

    @StateObject var locationManager = LocationManager()

    var country: String { return "\(locationManager.currentPlacemark?.country ?? "")"
        }

    var state: String { return "\(locationManager.currentPlacemark?.administrativeArea ?? "")"
        }

    var city: String { return "\(locationManager.currentPlacemark?.subAdministrativeArea ?? "")"
        }

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }

    var body: some View {
        VStack {
            Text("city: \(city)")
            Text("state: \(state)")
            Text("country: \(country)")
            Text("location status: \(locationManager.statusString)")
            HStack {
                Text("latitude: \(userLatitude)")
                Text("longitude: \(userLongitude)")
            }
        }
    }
}

struct LocationTestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationTestView()
    }
}
