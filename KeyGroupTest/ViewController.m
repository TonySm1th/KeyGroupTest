//
//  ViewController.m
//  KeyGroupTest
//
//  Created by Anton on 16.09.2018.
//  Copyright © 2018 Kuznetsov_Anton. All rights reserved.
//

#import "ViewController.h"

#import <GooglePlacePicker/GooglePlacePicker.h>
#import <GooglePlaces/GooglePlaces.h>

@interface ViewController () <GMSPlacePickerViewControllerDelegate>

@end

@implementation ViewController {
    GMSPlacePickerViewController *_placePickerViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:nil];
    _placePickerViewController = [[GMSPlacePickerViewController alloc] initWithConfig:config];
    _placePickerViewController.delegate = self;
    
    NSString *titleButton = @"Start Test";
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [startButton setTitle:titleButton forState:UIControlStateNormal];
    [startButton setTintColor:[UIColor darkGrayColor]];
    [startButton addTarget:self
                    action:@selector(showPlaces:)
          forControlEvents:UIControlEventTouchUpInside];
    
    startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:startButton];
    [NSLayoutConstraint constraintWithItem:startButton
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1
                                  constant:8]
    .active = YES;
    [NSLayoutConstraint constraintWithItem:startButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1
                                  constant:8]
    .active = YES;
    
}

- (void)showPlaces:(UIButton *)button {
    [self presentViewController:_placePickerViewController animated:YES completion:nil];
}


#pragma mark - GMSPlacePickerViewControllerDelegate

- (void)placePicker:(GMSPlacePickerViewController *)viewController didPickPlace:(GMSPlace *)place {
    if (viewController.navigationController == self.navigationController) {
        [self.navigationController popToViewController:self animated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)placePickerDidCancel:(GMSPlacePickerViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
