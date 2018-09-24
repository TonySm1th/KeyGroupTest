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

@property (strong, nonatomic) GMSPlacePickerViewController *placePickerViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createPlacePicker];
    [self configureButton];
}

#pragma mark - Methods

- (void) createPlacePicker{
    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:nil];
    self.placePickerViewController = [[GMSPlacePickerViewController alloc] initWithConfig:config];
    self.placePickerViewController.delegate = self;
}

- (void) configureButton{
    NSString *titleButton = @"Start Test";
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [startButton setTitle:titleButton forState:UIControlStateNormal];
    [startButton setTintColor:[UIColor darkGrayColor]];
    [startButton addTarget:self
                    action:@selector(showPlaces:)
          forControlEvents:UIControlEventTouchUpInside];
    
    startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:startButton];
    
    [startButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor
                                              constant:8.0].active = YES;
    
    [startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor
                                              constant:8.0].active = YES;
    }

- (void)showPlaces:(UIButton *)button {
    [self presentViewController:self.placePickerViewController animated:YES completion:nil];
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
