//
//  ViewController.h
//  FFAP Custom Object
//
//  Created by Fernando Penteado on 9/9/16.
//  Copyright © 2016 Fernando Penteado. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFAPSegmentedControl : UIView {
    
    NSMutableArray *labels;
    NSTextAttachment *attributedImage;
}
// list of options to be displayed
@property (strong, nonatomic) NSArray *listOptions;
// background color when selected
@property (strong, nonatomic) UIColor *selectedBackgroundColor;
// border color when selelected
@property (strong, nonatomic) UIColor *selectedBorderColor;
// text color when selelected
@property (strong, nonatomic) UIColor *selectedTextColor;
// background color when unselelected
@property (strong, nonatomic) UIColor *normalBackgroundColor;
// border color when unselelected
@property (strong, nonatomic) UIColor *normalBorderColor;
// text color when unselelected
@property (strong, nonatomic) UIColor *normalTextColor;
// border radius - default 5
@property (nonatomic, assign) float radius;
// border Width - default 1
@property (nonatomic, assign) float borderWidth;
// space between options - default 2
@property (nonatomic, assign) float spaceBetween;
// selected item - -1 (none selected)
@property (nonatomic, assign) int selectedIndex;
// selected image - default nil
@property (nonatomic, assign) UIImage *selectedImage;
// selected image size - default same size as font
@property (nonatomic, assign) CGSize selectedImageSize;
// font
@property (strong, nonatomic) UIFont *font;

-(NSString*) getSelectedText;


@end

