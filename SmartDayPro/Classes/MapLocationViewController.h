//
//  MapLocationViewController.h
//  SmartDayPro
//
//  Created by Nguyen Van Thuc on 9/12/13.
//  Copyright (c) 2013 Left Coast Logic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class Task;

@interface MapLocationViewController : UIViewController <UITextFieldDelegate, MKMapViewDelegate>
{
    UIView *contentView;
    MKMapView *mapView;
    
    Task *task;
    
    UITextField *locationTextField;
    UILabel *etaLable;
}

@property (nonatomic, assign) Task *task;
@end
