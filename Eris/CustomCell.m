//
//  CustomCell.m
//  Eris
//
//  Created by Christopher Pasquith on 12/1/15.
//  Copyright © 2015 KevinPerez.COP4656. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize cellImage = _cellImage;
@synthesize location = _location;
@synthesize lat = _lat;
@synthesize lng = _lng;


- (IBAction)goToMap:(id)sender {
    NSString *myurl = @"http://maps.apple.com?q=";
    myurl = [myurl stringByAppendingString:_lat];
    myurl = [myurl stringByAppendingString:@","];
    myurl = [myurl stringByAppendingString:_lng];
    NSURL *url = [NSURL URLWithString:myurl];
    [[UIApplication sharedApplication] openURL:url];
}
@end