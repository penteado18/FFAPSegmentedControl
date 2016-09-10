//
//  ViewController.m
//  FFAPSegmaneteControl
//
//  Created by Fernando Penteado on 9/10/16.
//  Copyright © 2016 Fernando Penteado. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    CGFloat space = 10;
    CGFloat width = [UIScreen mainScreen].bounds.size.width -(space*2);
    
    self.view.backgroundColor = [UIColor colorWithRed:0.125 green:0.627 blue:0.914 alpha:1.00];
    obj = [[FFAPSegmentedControl alloc] initWithFrame:CGRectMake(space,50,width,50)];
    obj.listOptions = @[@"Segment #1", @"Segment #2"];
    obj.normalBackgroundColor = [UIColor colorWithRed:0.369 green:0.761 blue:0.941 alpha:1.00];
    obj.normalTextColor = [UIColor whiteColor];
    obj.normalBorderColor = [UIColor colorWithRed:0.125 green:0.627 blue:0.914 alpha:1.00];
    obj.selectedBackgroundColor = [UIColor colorWithRed:0.369 green:0.761 blue:0.941 alpha:1.00];
    obj.selectedBorderColor = [UIColor whiteColor];
    obj.selectedImage = [UIImage imageNamed:@"checked.png"];
    obj.borderWidth = 2.0f;
    
    [self.view addSubview:obj];
    
    
    
    obj = [[FFAPSegmentedControl alloc] initWithFrame:CGRectMake(space,150,width,50)];
    obj.listOptions = @[@"Test #1", @"Test #2", @"Test #3", @"Test #4"];
    obj.normalBackgroundColor = [UIColor colorWithRed:0.369 green:0.761 blue:0.941 alpha:1.00];
    obj.normalTextColor = [UIColor whiteColor];
    obj.normalBorderColor = [UIColor colorWithRed:0.125 green:0.627 blue:0.914 alpha:1.00];
    obj.selectedBackgroundColor = [UIColor colorWithRed:0.369 green:0.761 blue:0.941 alpha:1.00];
    obj.selectedBorderColor = [UIColor whiteColor];
    obj.selectedImage = [UIImage imageNamed:@"checked.png"];
    obj.borderWidth = 2.0f;
    
    [self.view addSubview:obj];
}

@end
