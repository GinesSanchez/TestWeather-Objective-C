//
//  WeatherViewController.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-17.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityTemperatureInfoLabel;

@property (weak, nonatomic) IBOutlet UIButton *tapMeButton;

@property (weak, nonatomic) IBOutlet UIImageView *greenCircleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blueCircleImageView;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUp];
    [self.viewModel viewLoaded];
}

//MARK: - WeatherViewControllerDelegate
- (void)viewModelStateUpdated {
    [self reloadView];
}

//MARK: - Helper methods
-(void) setUp {
    [self setUpLabels];
    [self setUpNavigationBar];
    [self setUpButtons];
    [self setUpImages];
}

-(void) setUpLabels {
    self.titleLabel.text = [self.viewModel titleText];
    self.cityTemperatureInfoLabel.text = [self.viewModel cityWeatherInfo];
}

-(void) setUpNavigationBar {
    [self.navigationController setNavigationBarHidden: YES animated: NO];
}

-(void) setUpButtons {
    [self.tapMeButton setTitle: [self.viewModel tapMeButtonTitle] forState: UIControlStateNormal];
    [self.tapMeButton setBackgroundImage: [UIImage imageNamed: @"redCircleImage"] forState: UIControlStateNormal];
}

-(void) setUpImages {
    [self.greenCircleImageView setImage: [UIImage imageNamed: @"greenCircleImage"]];
    [self.blueCircleImageView setImage: [UIImage imageNamed: @"blueCircleImage"]];
}

-(void) reloadView {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.cityTemperatureInfoLabel.text = [self.viewModel cityWeatherInfo];
    });
}

@end
