//
//  TabBarManager.m
//  Holler
//
//  Created by Nick ONeill on 8/17/11.
//  Copyright 2011 Holler Inc. All rights reserved.
//

#import "HBTabBarManager.h"
#import "HBCustomTabBar.h"

@implementation HBTabBarManager
@synthesize tabBar, topView;

- (id)initWithViewController:(UIViewController *)theVc topView:(UIView *)top delegate:(NSObject <HBTabBarDelegate>*)theDelegate selectedIndex:(NSInteger)index
{
    self = [super init];
    if( self )
    {
        delegate = theDelegate;
        self.topView = top;
        self.tabBar = [[[HBCustomTabBar alloc]init]autorelease];
        
        [self configureTabBar:theVc selectedIndex:index];
    }
    return self;
}

- (void)configureTabBar:(UIViewController *)vc selectedIndex:(NSInteger)index
{
    NSArray *topLevelObjects = [[NSBundle mainBundle]loadNibNamed:@"HBCustomTabBar" owner:self options:nil];
    for( id currentObject in topLevelObjects )
    {
        if([currentObject isKindOfClass:[HBCustomTabBar class]]){
            HBCustomTabBar *bar = (HBCustomTabBar *)currentObject;//[topLevelObjects objectAtIndex:0];
            [tabBar release];
            [bar retain];
            tabBar = bar;
            
            if (IS_IPHONE_5) {
                 tabBar.frame = CGRectMake(0, 489, 320, 59);
            }
            else {
                tabBar.frame = CGRectMake(0, 401, 320, 59);

            }            
            [vc.view insertSubview:tabBar aboveSubview:topView];
            break;
        }
    }
    if( index == 0 )
    {
        //[tabBar.hollersButton.imageView setImage:[UIImage imageNamed:@"news_button_h.png"]];
        //[tabBar.hollersButton setBackgroundImage:[UIImage imageNamed:@"news_button_h.png"] forState:UIControlStateNormal];
        [tabBar.hollersButton setImage:[UIImage imageNamed:@"news_button_h.png"] forState:UIControlStateNormal];
    }
    else
    {
        //[tabBar.hollersButton.imageView setImage:[UIImage imageNamed:@"news_button.png"]];
        //[tabBar.hollersButton setBackgroundImage:[UIImage imageNamed:@"news_button.png"] forState:UIControlStateNormal];
        [tabBar.hollersButton setImage:[UIImage imageNamed:@"news_button.png"] forState:UIControlStateNormal];
    }
    if( index == 2 )
    {
        //[tabBar.groupsButton.imageView setImage:[UIImage imageNamed:@"user_btm_selected.png"]];
        //[tabBar.groupsButton setBackgroundImage:[UIImage imageNamed:@"user_btm_selected.png"] forState:UIControlStateNormal];
        [tabBar.groupsButton setImage:[UIImage imageNamed:@"user_btm_selected.png"] forState:UIControlStateNormal];
    }
    else
    {
        //[tabBar.groupsButton.imageView setImage:[UIImage imageNamed:@"user_btm_normal.png"]];
        //[tabBar.groupsButton setBackgroundImage:[UIImage imageNamed:@"user_btm_normal.png"] forState:UIControlStateNormal];
        [tabBar.groupsButton setImage:[UIImage imageNamed:@"user_btm_normal.png"] forState:UIControlStateNormal];
    }
    //Configure all the buttons
    [tabBar.hollersButton addTarget:self action:@selector(loadActivities:) forControlEvents:UIControlEventTouchUpInside];
    [tabBar.groupsButton addTarget:self action:@selector(loadGroups:) forControlEvents:UIControlEventTouchUpInside];
    [tabBar.hollerButton addTarget:self action:@selector(loadCreateHoller:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - View Controller loading methods

- (void)loadActivities:(id)selector
{
    if( [delegate respondsToSelector:@selector(tabBarClicked:)] )
    {
        [delegate tabBarClicked:0];
    }
}
- (void)loadGroups:(id)selector
{
    if( [delegate respondsToSelector:@selector(tabBarClicked:)] )
        [delegate tabBarClicked:2];
}
- (void)loadCreateHoller:(id)selector
{
    if( [delegate respondsToSelector:@selector(tabBarClicked:)] )
        [delegate tabBarClicked:1];
}

- (void)dealloc
{
    [topView release];
    [tabBar release];
    [super dealloc];
}

@end
