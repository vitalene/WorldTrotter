//
//  MapViewController.m
//  WorldTrotter
//
//  Created by Neil Vitale on 9/12/16.
//  Copyright © 2016 Neil Vitale. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()
@property (nonatomic) MKMapView *mapView;
@end

@implementation MapViewController

// MARK: -  View Lifecycle

-(void)loadView {
    // Create a map view
    self.mapView = [MKMapView new];
    // Set it as *the* view of the view controller
    self.view = self.mapView;
    // Add a segmented control to the view
    NSString *standardString = NSLocalizedString(@"Standard", @"Standard map view"); NSString *hybridString = NSLocalizedString(@"Hybrid", @"Hybrid map view");
    NSString *satelliteString = NSLocalizedString(@"Satellite", @"Satellite map view"); NSArray *segItems = @[standardString, hybridString, satelliteString];
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:segItems];
    segControl.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:.5];
    segControl.selectedSegmentIndex = 0;
    
    segControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:segControl];
    
    [segControl addTarget:self
                   action:@selector(mapTypeChanged:)
         forControlEvents:UIControlEventValueChanged];
    
    
    
    
    NSLayoutConstraint *topConstraint =
    [segControl.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor
                                         constant:8];
    UILayoutGuide *margins = self.view.layoutMarginsGuide;
    NSLayoutConstraint *leadingConstraint =
    [segControl.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor];
    NSLayoutConstraint *trailingConstraint =
    [segControl.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor];
    
    topConstraint.active = YES;
    leadingConstraint.active = YES;
    trailingConstraint.active = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Map View Controller finished its view");
}

// MARK: - Actions

- (void)mapTypeChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeSatellite;
        default:
            break;
    } }

@end
