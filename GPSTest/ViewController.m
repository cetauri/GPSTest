//
//  ViewController.m
//  GPSTest
//
//  Created by cetauri on 12. 8. 1..
//  Copyright (c) 2012년 cetauri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {

//    NSLog(@"didUpdateToLocation---");
//    NSString *strInfo = [NSString stringWithFormat:@"latitude = %f, longitude%f ", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
//    NSLog(@"%@",  strInfo);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 2000, 2000);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:region];
    [mapView setRegion:adjustedRegion animated:YES];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:[error domain]
                                                       message:[error localizedDescription]
                                                      delegate:nil
                                             cancelButtonTitle:@"ok"
                                             otherButtonTitles:nil, nil];
    [alertView show];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.distanceFilter = 10.0f;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
        mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
        mapView.showsUserLocation = YES; //내 위치 표시.
         [mapView setMapType:MKMapTypeStandard]; //지도 형태는 기본.
         [mapView setZoomEnabled:YES]; //줌가능
//         [mapViewsetScrollEnabled:YES];!//스크롤가능

         mapView.delegate = self; //딜리게이트 설정 (anotation 의 메소드를 구현한다.)

//         MKCoordinateRegion region;
//         MKCoordinateSpan span; //보여줄 지도가 처리하는 넓이 정의.
//         span.latitudeDelta = 0.02; //숫자가 적으면 좁은영역 까지 보임.
//         span.longitudeDelta = 0.02; !

//        [mapView setRegion:region animated:TRUE]; //지도 뷰에 지역 설정.
//        [mapView regionThatFits:region];! //지도 화면에 맞게 크기 조정. !
        [self.view addSubview:mapView]; //서브 뷰로 지도를 추가함.


        [locationManager startUpdatingLocation];;
    NSLog(@"[locationManager startUpdatingLocation];");
}
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
