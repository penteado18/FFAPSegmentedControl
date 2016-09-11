# FFAPSegmentedControl
## Synopsis

This is a customized UISegmentedControl written in Objective-C

## Code Example

To use this control just follow the code below
```objective-c
    FFAPSegmentedControl *obj = [[FFAPSegmentedControl alloc] initWithFrame:CGRectMake(space,50,width,50)];
    obj.listOptions = @[@"Segment #1", @"Segment #2"];
    obj.normalBackgroundColor = [UIColor colorWithRed:0.369 green:0.761 blue:0.941 alpha:1.00];
    obj.normalTextColor = [UIColor whiteColor];
    obj.normalBorderColor = [UIColor colorWithRed:0.125 green:0.627 blue:0.914 alpha:1.00];
    obj.selectedBackgroundColor = [UIColor colorWithRed:0.369 green:0.761 blue:0.941 alpha:1.00];
    obj.selectedBorderColor = [UIColor whiteColor];
    obj.selectedImage = [UIImage imageNamed:@"checked.png"];
    obj.borderWidth = 2.0f;
```
## Contributors

Developed by Fernando Penteado

## License

Apache
