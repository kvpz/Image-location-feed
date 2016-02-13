//
//  FeedTableViewController.m
//  Eris
//
//  Created by Christopher Pasquith on 11/30/15.
//  Copyright © 2015 KevinPerez.COP4656. All rights reserved.
//

#import "FeedTableViewController.h"
#import "CustomCell.h"

@implementation FeedTableViewController

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
                                                                                     action:@selector(handleSwipeLeft:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.tableView addGestureRecognizer:recognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self){
        self.parseClassName = @"erisData";
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = NO;
        self.objectsPerPage = 10;
        
    }
    return self;
}

- (PFQuery *)queryForTable {
    
    
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    PFGeoPoint *userLocation = [PFGeoPoint geoPointWithLocation:[self.locationManager location]];
    [query whereKey:@"location" nearGeoPoint:userLocation];
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    static NSString *CellIdentifier = @"customCell";
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    PFFile *imageFile = [object objectForKey:@"image"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        
        [cell.cellImage setImage:[UIImage imageWithData:data]];
    }];
    
    PFGeoPoint *cellLocation = [object objectForKey:@"location"];
    
    cell.lat = [NSString stringWithFormat:@"%lf", cellLocation.latitude];
    cell.lng = [NSString stringWithFormat:@"%lf", cellLocation.longitude];

    return cell;
}

- (IBAction)handleSwipeLeft:(UISwipeGestureRecognizer *)gestureRecognizer
{
    [self performSegueWithIdentifier: @"SegueToCamera" sender: self];
}


@end
