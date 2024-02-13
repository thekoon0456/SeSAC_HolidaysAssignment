//
//  MapViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/13/24.
//

import MapKit
import UIKit

final class MapViewController: BaseViewController, VMViewController {
    
    // MARK: - Properties
    
    let viewModel: MapViewModel
    private let selectedCoord = UserDefaultsManager.shared.city.coord
    lazy var location = CLLocation(latitude: selectedCoord.lat, longitude: selectedCoord.lon)
    lazy var coordinate = CLLocationCoordinate2D(latitude: selectedCoord.lat,
                                                 longitude: selectedCoord.lon)
    lazy var region = MKCoordinateRegion(center: coordinate,
                                         latitudinalMeters: OWConst.Map.meter.value,
                                         longitudinalMeters: OWConst.Map.meter.value)
    
    private lazy var mapView = MKMapView().then {
        $0.delegate = self
    }
    
    // MARK: - Lifecycles
    
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGesture()
        getPlacemark(location: location) { [weak self] locality, country in
            guard let self else { return }
            setAnnotation(coordinate: coordinate, title: locality, subTitle: "현재")
        }
    }
    
    func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapViewTapped))
        mapView.addGestureRecognizer(tapGesture)
    }
    
    //맵뷰 annotation추가
    func setAnnotation(coordinate: CLLocationCoordinate2D, title: String, subTitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subTitle
        
        mapView.addAnnotation(annotation)
    }
    
    @objc func mapViewTapped(sender: UITapGestureRecognizer) {
        removeAllAnnotations()
        
        if sender.state == .ended {
            let location = sender.location(in: mapView)
            let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
            let lat = coordinate.latitude
            let lon = coordinate.longitude
            let clLocation = CLLocation(latitude: lat, longitude: lon)
            let region = MKCoordinateRegion(center: coordinate,
                                            latitudinalMeters: OWConst.Map.zoom.value,
                                            longitudinalMeters: OWConst.Map.zoom.value)
            mapView.setRegion(region, animated: true)
            
            getPlacemark(location: clLocation) { [weak self] locality, country in
                guard let self else { return }
                setAnnotation(coordinate: coordinate, title: locality, subTitle: "선택")
            }
        }
    }
    
    private func removeAllAnnotations() {
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
    }
    
    override func configureHierarchy() {
        view.addSubview(mapView)
    }
    
    override func configureLayout() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func configureView() {
        navigationItem.title = "지도로 날씨 선택하기"
    }
    
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
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        let lat = annotation.coordinate.latitude
        let lon = annotation.coordinate.longitude
        let location = CLLocation(latitude: lat, longitude: lon)
        
        getPlacemark(location: location) { [weak self] locality, country in
            guard let self else { return }
            viewModel.coordinator?.showMapAlert(location: locality) {
                UserDefaultsManager.shared.city = City(id: 0, name: locality, country: country, coord: CityCoord(lat: lat, lon: lon))
            }
        }
    }
}
