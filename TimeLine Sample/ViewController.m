//
//  ViewController.m
//  TimeLine Sample
//
//  Created by Chanti... on 7/29/14.
//  Copyright (c) 2014 DreamLordOneiros... All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize contentArray, preparedArray, contentSideFlag, selectedIP, previousIP, myTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    contentSideFlag = false;
    selectedIP = [NSIndexPath indexPathForRow:selectedIP.row* -1 inSection:selectedIP.section];
    contentArray = [[NSMutableArray alloc] initWithObjects:@"Content One", @"Content Two", @"Content Three", @"Content Four", @"Content Five", nil];
    [self prepareData:contentArray];
}

-(void) prepareData:(NSMutableArray*) array
{
    preparedArray = [[NSMutableArray alloc] init];
    int counter = 0;
    for (NSString * string in contentArray)
    {
        [preparedArray addObject:string];
        if ((counter % 2) != 0)
            [preparedArray addObject:@{ @"time" : @"12:00", @"name" : [NSString stringWithFormat:@"%@ Meeting", string], @"nodeType" : @"leftCustomCell"}];
        else
            [preparedArray addObject:@{ @"time" : @"12:00", @"name" : [NSString stringWithFormat:@"%@ Meeting", string], @"nodeType" : @"rightCustomCell"}];
        counter ++;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [preparedArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        TopCustomCell * cell = (TopCustomCell*)[tableView dequeueReusableCellWithIdentifier:@"topCustomCell" forIndexPath:indexPath];
        [cell setIPath:indexPath];
        [cell setDelegate:self];
        [cell clipsToBounds];
        return cell;
    }
    else if (indexPath.row == ([preparedArray count] - 1))
    {
        BottomCustomCell * cell = (BottomCustomCell*)[tableView dequeueReusableCellWithIdentifier:@"bottomCustomCell" forIndexPath:indexPath];
        [cell setIPath:indexPath];
        [cell setDelegate:self];
        [cell clipsToBounds];
        return cell;
    }
    else if (indexPath.row == ([preparedArray count] - 2))
    {
        if (contentSideFlag)
        {
            LeftCustomCell * cell = (LeftCustomCell*)[tableView dequeueReusableCellWithIdentifier:@"leftCustomCell" forIndexPath:indexPath];
            contentSideFlag = false;
            [cell clipsToBounds];
            return cell;
        }
        else
        {
            RightCustomCell * cell = (RightCustomCell*)[tableView dequeueReusableCellWithIdentifier:@"rightCustomCell" forIndexPath:indexPath];
            contentSideFlag = (BOOL*)true;
            [cell clipsToBounds];
            return cell;
        }
    }
    else
    {
        if ([[preparedArray objectAtIndex:indexPath.row] isKindOfClass:[NSString class]])
        {
            NodeCustomCell * cell = (NodeCustomCell*)[tableView dequeueReusableCellWithIdentifier:@"nodeCustomCell" forIndexPath:indexPath];
            [cell setIPath:indexPath];
            [cell setDelegate:self];
            [cell clipsToBounds];
            return cell;
        }
        else
        {
            if (contentSideFlag)
            {
                LeftCustomCell * cell = (LeftCustomCell*)[tableView dequeueReusableCellWithIdentifier:@"leftCustomCell" forIndexPath:indexPath];
                contentSideFlag = false;
                [cell clipsToBounds];
                return cell;
            }
            else
            {
                RightCustomCell * cell = (RightCustomCell*)[tableView dequeueReusableCellWithIdentifier:@"rightCustomCell" forIndexPath:indexPath];
                contentSideFlag = (BOOL*)true;
                [cell clipsToBounds];
                return cell;
            }
        }
    }
    UITableViewCell * cell;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexPath.row == [preparedArray count] - 2))
    {
        if ([indexPath compare:selectedIP] == NSOrderedSame )
        {
            if ([selectedIP compare:previousIP] == NSOrderedSame)
            {
                selectedIP = [NSIndexPath indexPathForRow:(indexPath.row * -1) inSection:selectedIP.section];
                return 0;
            }
            return 88;
        }
        return 0;
    }
    if ((indexPath.row == [preparedArray count] - 1))
    {
        return  44;
    }
    if ([[preparedArray objectAtIndex:indexPath.row] isKindOfClass:[NSDictionary class]])
    {
        if ([indexPath compare:selectedIP] == NSOrderedSame )
        {
            if ([selectedIP compare:previousIP] == NSOrderedSame)
            {
                selectedIP = [NSIndexPath indexPathForRow:(indexPath.row * -1) inSection:selectedIP.section];
                return 0;
            }
            return 88;
        }
        return 0;
    }
    return 44;
}

-(void) toggleContent:(NSIndexPath*) path
{
        previousIP = selectedIP;
        selectedIP = path;
        
        [myTableView beginUpdates];
        [myTableView endUpdates];
}

-(void) fadeIn: (UILabel*) label
{
    [label setAlpha:0];
    [UILabel beginAnimations:NULL context:nil];
    [UILabel setAnimationDuration:2.0];
    [label setAlpha:1];
    [UILabel commitAnimations];
}

-(void) fadeOut: (UILabel*) label
{
    [UILabel beginAnimations:NULL context:nil];
    [UILabel setAnimationDuration:2.0];
    [label setAlpha:0];
    [UILabel commitAnimations];
}

@end
