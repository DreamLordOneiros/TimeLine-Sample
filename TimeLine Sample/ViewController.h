//
//  ViewController.h
//  TimeLine Sample
//
//  Created by Chanti... on 7/29/14.
//  Copyright (c) 2014 DreamLordOneiros... All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopCustomCell.h"
#import "LeftCustomCell.h"
#import "NodeCustomCell.h"
#import "RightCustomCell.h"
#import "BottomCustomCell.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, topDelegate, nodeDelegate, bottomDelegate>

@property (strong, nonatomic) NSMutableArray * contentArray;
@property (strong, nonatomic) NSMutableArray * preparedArray;

@property (nonatomic) BOOL * contentSideFlag;

@property (strong, nonatomic) NSIndexPath * selectedIP;
@property (strong, nonatomic) NSIndexPath * previousIP;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end
