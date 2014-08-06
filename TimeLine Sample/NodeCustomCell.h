//
//  NodeCustomCell.h
//  TimeLine Sample
//
//  Created by Chanti... on 7/29/14.
//  Copyright (c) 2014 DreamLordOneiros... All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol nodeDelegate <NSObject>

-(void) toggleContent:(NSIndexPath*) path;

@end

@interface NodeCustomCell : UITableViewCell

@property (strong, nonatomic) NSIndexPath * iPath;
@property (strong, nonatomic) id delegate;

- (IBAction)xpandNodeContent:(id)sender;

@end
