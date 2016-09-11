//
//  ViewController.m
//  FFAP Custom Object
//
//  Created by Fernando Penteado on 9/9/16.
//  Copyright © 2016 Fernando Penteado. All rights reserved.
//

#import "FFAPSegmentedControl.h"

@interface FFAPSegmentedControl ()

@end

@implementation FFAPSegmentedControl

- (id)init {
    if (self = [super init]) {
        [self loadDefaults];
    }
    return self;
}
- (id)initWithFrame:(CGRect) aRect {
    if (self = [super initWithFrame:aRect]) {
        [self loadDefaults];
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"frame"];
    [self removeObserver:self forKeyPath:@"selectedIndex"];
    [self removeObserver:self forKeyPath:@"selectedImage"];
    [self removeObserver:self forKeyPath:@"selectedImageOffset"];
    [self removeObserver:self forKeyPath:@"selectedImageSize"];
    [self removeObserver:self forKeyPath:@"listOptions"];
    [self removeObserver:self forKeyPath:@"selectedImageSize"];
    [self removeObserver:self forKeyPath:@"selectedBackgroundColor"];
    [self removeObserver:self forKeyPath:@"selectedBorderColor"];
    [self removeObserver:self forKeyPath:@"selectedTextColor"];
    [self removeObserver:self forKeyPath:@"normalBorderColor"];
    [self removeObserver:self forKeyPath:@"normalTextColor"];
    [self removeObserver:self forKeyPath:@"radius"];
    [self removeObserver:self forKeyPath:@"spaceBetween"];
    [self removeObserver:self forKeyPath:@"borderWidth"];
}

-(void) loadDefaults {
    _selectedBackgroundColor = [UIColor blackColor];
    _selectedBorderColor = [UIColor blackColor];
    _selectedTextColor = [UIColor whiteColor];
    _normalBackgroundColor = [UIColor whiteColor];
    _normalBorderColor = [UIColor blackColor];
    _normalTextColor = [UIColor blackColor];
    _radius = 5.0f;
    _borderWidth = 1.0;
    _spaceBetween = 2;
    _selectedIndex = -1;
    _font = [UIFont systemFontOfSize: [UIFont labelFontSize]];
    _selectedImageSize = CGSizeMake([UIFont labelFontSize], [UIFont labelFontSize]);
    [self addObserver:self forKeyPath:@"frame" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedIndex" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedImageOffset" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedImageSize" options:0 context:nil];
    [self addObserver:self forKeyPath:@"listOptions" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedImageSize" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedBackgroundColor" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedBorderColor" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedTextColor" options:0 context:nil];
    [self addObserver:self forKeyPath:@"normalBorderColor" options:0 context:nil];
    [self addObserver:self forKeyPath:@"normalTextColor" options:0 context:nil];
    [self addObserver:self forKeyPath:@"radius" options:0 context:nil];
    [self addObserver:self forKeyPath:@"spaceBetween" options:0 context:nil];
    [self addObserver:self forKeyPath:@"borderWidth" options:0 context:nil];
}

#pragma mark - Others
-(NSString*) getSelectedText {
    if (_selectedIndex == -1) {
        return nil;
    } else {
        return _listOptions[_selectedIndex];
    }
}

#pragma mark - Tap Gesture
// Triggered when the user touch any of the options
- (void)selectItemTapGesture:(UITapGestureRecognizer *)tapGesture {
    UILabel *lbl = (UILabel *)tapGesture.view;
    self.selectedIndex = (int)lbl.tag;
}


#pragma mark - UI
// Build the Segmented control
- (void) buildObject {
    labels = [[NSMutableArray alloc] init];
    if (_listOptions == nil || _listOptions.count == 0) {
        return;
    }
    float labelWidth = [self getWidth];
    int posX = 0;
    for (int idx = 0; idx < _listOptions.count; idx++) {
        NSString *str = _listOptions[idx];
        UILabel *lbl = [[UILabel alloc] initWithFrame: CGRectMake(posX,0,labelWidth,self.frame.size.height)];
        
        
        lbl.text = str;
        
        
        lbl.textAlignment = NSTextAlignmentCenter;
        UIRectCorner corners = 0;
        if (idx ==0) {
            corners = corners|UIRectCornerTopLeft|UIRectCornerBottomLeft;
        }
        if (idx == _listOptions.count-1) {
            corners = corners|UIRectCornerTopRight|UIRectCornerBottomRight;
        }
        [self roundCorners: corners radius: _radius  obj: lbl borderColor: (_selectedIndex==idx)?_selectedBorderColor:_normalBorderColor];
        
        lbl.tag = idx;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectItemTapGesture:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        lbl.userInteractionEnabled = YES;
        [lbl addGestureRecognizer:tapGestureRecognizer];
        [labels addObject: lbl];
        
        [self addSubview: lbl];
        posX = posX + labelWidth + _spaceBetween;
    }
}

// Created the rouded corner with the borders
-(void)roundCorners: (UIRectCorner)corners
             radius: (CGFloat)radius obj: (UILabel *) l borderColor: (UIColor*) color {
    CGRect bounds = l.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    
    l.layer.mask = maskLayer;
    
    CAShapeLayer*   frameLayer = [CAShapeLayer layer];
    frameLayer.lineWidth = _borderWidth;
    frameLayer.frame = bounds;
    frameLayer.path = maskPath.CGPath;
    frameLayer.strokeColor = color.CGColor;
    frameLayer.fillColor = nil;
    
    [l.layer addSublayer:frameLayer];
}

// Returns the width of each option
-(float) getWidth {
    int amountItems = (int) _listOptions.count;
    float ret = (self.frame.size.width - (amountItems*_spaceBetween))/amountItems;
    return ret;
}

// Update the options when the parameter is changed or a new option is selected
-(void) refreshSelection {
    for (int idx = 0; idx < labels.count; idx++) {
        UILabel *lbl = labels[idx];
        UIColor *border;
        UIColor *background;
        UIColor *text;
        if (idx == _selectedIndex) {
            border = _selectedBorderColor;
            text = _selectedTextColor;
            background = _selectedBackgroundColor;
            if (_selectedImage != nil) {
                NSMutableAttributedString *myString = [[NSMutableAttributedString alloc] init];
                if (attributedImage != nil) {
                    NSAttributedString *attributedImageString = [NSAttributedString attributedStringWithAttachment:attributedImage];
                    [myString appendAttributedString:attributedImageString];
                }
                [myString appendAttributedString:[[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat:@" %@", _listOptions[idx]]]];
                lbl.attributedText=myString;
                
            }
        } else {
            border = _normalBorderColor;
            text = _normalTextColor;
            background = _normalBackgroundColor;
            lbl.text = _listOptions[idx];
        }
        lbl.backgroundColor = background;
        lbl.textColor = text;
        lbl.font = _font;
        CAShapeLayer *layer = (CAShapeLayer*) lbl.layer.sublayers[0];
        layer.strokeColor = border.CGColor;
        layer.lineWidth = _borderWidth;
    }
}

#pragma mark - Observe
// update the view automatically when any parameter is changed
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if ([keyPath isEqual:@"frame"] || [keyPath isEqual:@"listOptions"] || [keyPath isEqual:@"radius"] || [keyPath isEqual:@"spaceBetween"]) {
        for (UILabel *lbl in labels) {
            [lbl removeFromSuperview];
        }
        [self buildObject];
    } else if ([keyPath isEqual:@"selectedImage"]) {
        attributedImage = [[NSTextAttachment alloc] init];
        attributedImage.image = _selectedImage;
        attributedImage.bounds = CGRectMake(0, -2.0, _selectedImageSize.width, _selectedImageSize.height);
    } else if ([keyPath isEqual:@"selectedIndex"]) {
        if (_selectedIndex >= _listOptions.count) {
            _selectedIndex =-1;
        }
    }
    
    [self refreshSelection];
}



@end
