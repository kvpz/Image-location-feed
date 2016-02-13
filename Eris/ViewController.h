//
//  TableViewController.h
//  Eris
//
//  Created by Kevin Perez on 11/20/15.
//  Copyright (c) 2015 KevinPerez.COP4656. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>


@interface TableViewController : PFQueryTableViewController <UIGestureRecognizerDelegate, UITableViewDataSource,
																							UITableViewDelegate, NSLayoutManagerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *tableTopLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;




@end
