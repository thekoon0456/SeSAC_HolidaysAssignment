//
//  MapViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/13/24.
//

import MapKit
import UIKit

final class MapViewController: BaseViewController {
    
    // MARK: - Properties
    
    let viewModel: MapViewModel
    let locationManager = LocationManager.shared
    lazy var coordinate = CLLocationCoordinate2D(latitude: locationManager.lat,
                                            longitude: locationManager.lon)
    lazy var region = MKCoordinateRegion(center: coordinate,
                                   latitudinalMeters: 10000,
                                   longitudinalMeters: 10000)
    
    private lazy var mapView = MKMapView().then {

        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        $0.setRegion(region, animated: true)
        
        $0.delegate = self
    }
    
    // MARK: - Lifecycles
    
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAnnotation(coordinate: coordinate, title: "현재 위치", subTitle: "여기")
        setGesture()
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
        if sender.state == .ended {

            let location = sender.location(in: mapView)
            let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
            let region = MKCoordinateRegion(center: coordinate,
                                            latitudinalMeters: 1000,
                                            longitudinalMeters: 1000)
            
            mapView.setRegion(region, animated: true)
            setAnnotation(coordinate: coordinate, title: "여기", subTitle: "선택")
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
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print("눌림")
        showAlert(title: "지역 선택",
                  message: "해당 지역의 날씨를 설정하시겠습니까?",
                  primaryButtonTitle: "설정하기") {
            let lat = annotation.coordinate.latitude
            let lon = annotation.coordinate.longitude
            
            self.locationManager.lat = lat
            self.locationManager.lon = lon
        } cancleAction: {
            self.dismiss(animated: true)
        }

    }

}
