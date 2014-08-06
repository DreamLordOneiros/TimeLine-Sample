//
//  TopCustomCell.h
//  TimeLine Sample
//
//  Created by Chanti... on 7/29/14.
//  Copyright (c) 2014 DreamLordOneiros... All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol topDelegate <NSObject>

-(void) toggleContent:(NSIndexPath*) path;

@end

@interface TopCustomCell : UITableViewCell

@property (strong, nonatomic) NSIndexPath * iPath;
@property (strong, nonatomic) id delegate;

- (IBAction)xpandTopContent:(id)sender;

@end
