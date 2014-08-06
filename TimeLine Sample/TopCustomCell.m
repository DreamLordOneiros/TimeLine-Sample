//
//  TopCustomCell.m
//  TimeLine Sample
//
//  Created by Chanti... on 7/29/14.
//  Copyright (c) 2014 DreamLordOneiros... All rights reserved.
//

#import "TopCustomCell.h"

@implementation TopCustomCell
@synthesize delegate, iPath;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)xpandTopContent:(id)sender
{
    [delegate toggleContent: [NSIndexPath indexPathForRow:(iPath.row + 1) inSection:iPath.section]];
}
@end
