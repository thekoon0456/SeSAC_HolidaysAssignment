//
//  LocationManager.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/14/24.
//

import MapKit
import UIKit

final class LocationManager {
    
    // MARK: - Properties
    
    static let shared = LocationManager()

    var selectedCoord = UserDefaultsManager.shared.city.coord
    lazy var location = CLLocation(latitude: selectedCoord.lat, longitude: selectedCoord.lon)
    lazy var coordinate = CLLocationCoordinate2D(latitude: selectedCoord.lat,
                                                 longitude: selectedCoord.lon)
    
    // MARK: - Lifecycles
    
    private init() { }
    
    // MARK: - Helpers
    
    func setAnnotation(mapView: MKMapView, coordinate: CLLocationCoordinate2D, title: String, subTitle: String) {
        //기존 annotation 리셋
        resetMapAnnotation(mapView: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subTitle
        
        mapView.addAnnotation(annotation)
    }
    
    //annotation 리셋
    func resetMapAnnotation(mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    //주소 가져오기
    func getPlacemark(location: CLLocation, completion: @escaping ((locality: String, country: String)) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            
            if let error {
                print(error.localizedDescription)
                print("DEBUG: 주소 변환 에러")
            }
            
            guard let placemark = placemarks?.last else { return }
            
            if let locality = placemark.locality,
               let country = placemark.country {
                completion((locality, country))
                return
            }
            
            if let adArea = placemark.administrativeArea,
               let country = placemark.country {
                completion((adArea, country))
                return
            }
        }
    }
    
    //city 설정 업데이트
    func updateCity() {
        selectedCoord = UserDefaultsManager.shared.city.coord
        location = CLLocation(latitude: selectedCoord.lat, longitude: selectedCoord.lon)
        coordinate = CLLocationCoordinate2D(latitude: selectedCoord.lat,
                                                     longitude: selectedCoord.lon)
    }
}
