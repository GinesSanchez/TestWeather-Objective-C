//
//  SecondaryViewController.m
//  TestWeatherObjectiveC
//
//  Created by Gines Sanchez Merono on 2020-04-18.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

#import "SecondaryViewController.h"

@interface SecondaryViewController ()

@property (weak, nonatomic) IBOutlet UIButton *goBackButton;

@end

@implementation SecondaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUp];
}

-(void) viewWillAppear: (BOOL)animated {
    [super viewWillAppear: animated];
    [self.viewModel viewLoaded];
}


//MARK: - Helper methods
-(void) setUp {
    [self setUpButtons];
}

-(void) setUpButtons {
    [self.goBackButton setTitle: [self.viewModel goBackButtonTitle] forState: UIControlStateNormal];
    [self.goBackButton setBackgroundImage: [UIImage imageNamed: @"blueCircleImage"] forState: UIControlStateNormal];
}


//MARK: - IBActions
- (IBAction)goBackButtonTapped:(id)sender {
    [self.viewModel goBackButtonTapped];
}


@end
