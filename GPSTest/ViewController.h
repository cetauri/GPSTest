//
//  ViewController.h
//  GPSTest
//
//  Created by cetauri on 12. 8. 1..
//  Copyright (c) 2012년 cetauri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate>{
    CLLocationManager *locationManager;
    MKMapView *mapView; //지도
//    MKReverseGeocoder *reverseGeocoder;

}

@end
