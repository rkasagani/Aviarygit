//
//  DetailViewController.h
//  Aviary
//
//  Created by saven on 7/7/14.
//  Copyright (c) 2014 saven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
