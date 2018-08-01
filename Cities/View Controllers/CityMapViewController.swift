//
//  CityMapViewController.swift
//  Cities
//
//  Created by Blake Loizides on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import UIKit
import MapKit

class CityMapViewController: BaseViewController {
  
  @IBOutlet fileprivate weak var cityMapView: MKMapView?
  fileprivate var annotationView: MKAnnotationView?
  fileprivate var selectedPin: MKPlacemark?
  internal var city: City?

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupNavigation(navigationTitle: "City Map")
    self.setupMapview()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  fileprivate func setupMapview() {
    guard let coordinates = city?.coordinates,
      let cityMapView = self.cityMapView,
      let name = city?.name,
      let country = city?.country else {
      return
    }
    let placemark = MKPlacemark(coordinate:coordinates, addressDictionary: nil)
    cityMapView.removeAnnotations(cityMapView.annotations)
    let annotationPin = MKPointAnnotation()
    annotationPin.coordinate = placemark.coordinate
    annotationPin.title = "\(name), \(country)"
    cityMapView.addAnnotation(annotationPin)
    let span = MKCoordinateSpanMake(0.8, 0.8)
    let region = MKCoordinateRegionMake(placemark.coordinate, span)
    cityMapView.setRegion(region, animated: true)
  }
}

extension CityMapViewController : MKMapViewDelegate {

  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    // Don't want to show a custom image if the annotation is the user's location.
    guard !(annotation is MKUserLocation) else {
      return nil
    }
    // Better to make this class property
    let annotationIdentifier = "AnnotationIdentifier"
    if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
      annotationView = dequeuedAnnotationView
      annotationView?.annotation = annotation
    } else {
      annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
      annotationView?.rightCalloutAccessoryView?.isHidden = true
    }
    if let annotationView = annotationView {
      annotationView.canShowCallout = true
      annotationView.isDraggable = false
      annotationView.image = UIImage(named: "mapViewPinIcon")
    }
    return annotationView
  }
  
  func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
    
  }
  
  func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    
  }
}
