//
//  CustomCell.h
//  Eris
//
//  Created by Christopher Pasquith on 12/1/15.
//  Copyright © 2015 KevinPerez.COP4656. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

@interface CustomCell : PFTableViewCell
@property (nonatomic, strong) IBOutlet UIImageView *cellImage;
@property (nonatomic, strong) IBOutlet UIButton *location;
@property (nonatomic, strong) IBOutlet NSString *lat;
@property (nonatomic, strong) IBOutlet NSString *lng;
- (IBAction)goToMap:(id)sender;

@end
