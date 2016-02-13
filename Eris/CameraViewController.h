//
//  CameraViewController.h
//  Eris
//
//  Created by Christopher Pasquith on 11/30/15.
//  Copyright © 2015 KevinPerez.COP4656. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>


@interface CameraViewController : UIViewController<CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *recognizer;
@property (strong, nonatomic) IBOutlet UIImageView *cameraDisplay;


- (IBAction)takePictureButton:(id)sender;

@end
