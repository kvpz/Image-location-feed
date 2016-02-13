//
//  CameraViewController.m
//  Eris
//
//  Created by Christopher Pasquith on 11/30/15.
//  Copyright © 2015 KevinPerez.COP4656. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController

/*- (void)viewDidAppear:(BOOL)animated{
   
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Request Location Services
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    //Add a left swipe gesture recognizer
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(handleSwipeRight:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)takePictureButton:(id)sender {
    UIImagePickerController *select = [[UIImagePickerController alloc] init];
    select.delegate = self;
    select.allowsEditing = YES;
    select.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:select animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage];
    PFObject *submission = [PFObject objectWithClassName:@"erisData"];
    submission[@"description"] = @"Test";
    submission[@"location"] = [PFGeoPoint geoPointWithLocation:[self.locationManager location]];
    submission[@"image"] = [PFFile fileWithData:UIImageJPEGRepresentation(selectedImage, 0.8f)];
    [submission saveInBackground];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self performSegueWithIdentifier:@"SegueToFeed" sender:self];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)handleSwipeRight:(UISwipeGestureRecognizer *)gestureRecognizer
{
    [self performSegueWithIdentifier: @"SegueToFeed" sender: self];
}

@end
