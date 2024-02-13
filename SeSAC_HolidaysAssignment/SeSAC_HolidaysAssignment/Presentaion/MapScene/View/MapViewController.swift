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
    private let locationManager = LocationManager.shared
    
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
        locationManager.getPlacemark(location: locationManager.location) { [weak self] locality, country in
            guard let self else { return }
            locationManager.setAnnotation(mapView: mapView,
                                          coordinate: locationManager.coordinate,
                                          title: locality,
                                          subTitle: "현재")
        }
    }
    
    // MARK: - Selectors
    
    @objc func mapViewTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let location = sender.location(in: mapView)
            let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
            let lat = coordinate.latitude
            let lon = coordinate.longitude
            let clLocation = CLLocation(latitude: lat, longitude: lon)
            let region = MKCoordinateRegion(center: coordinate,
                                            latitudinalMeters: OWConst.Map.defaultMeter.value,
                                            longitudinalMeters: OWConst.Map.defaultMeter.value)
            mapView.setRegion(region, animated: true)
            
            locationManager.getPlacemark(location: clLocation) { [weak self] locality, country in
                guard let self else { return }
                locationManager.setAnnotation(mapView: mapView,
                                              coordinate: coordinate,
                                              title: locality,
                                              subTitle: "선택")
            }
        }
    }
    
    // MARK: - Helpers
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapViewTapped))
        mapView.addGestureRecognizer(tapGesture)
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
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        let lat = annotation.coordinate.latitude
        let lon = annotation.coordinate.longitude
        let location = CLLocation(latitude: lat, longitude: lon)

        locationManager.getPlacemark(location: location) { [weak self] locality, country in
            guard let self else { return }
            viewModel.coordinator?.showMapAlert(location: locality) {                UserDefaultsManager.shared.city = City(id: 0,
                                                       name: locality,
                                                       country: country,
                                                       coord: CityCoord(lat: lat, lon: lon))
                LocationManager.shared.updateCity()
            }
        }
    }
}
