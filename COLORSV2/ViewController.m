//
//  ViewController.m
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    //Add view controller as observer
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"hideAd" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"showAd" object:nil];
    
    // Create and configure the scene.
    SKScene * scene = [TitleScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, 0.0f);
    adView.delegate=self;
    [self.view addSubview:adView];
    self.canDisplayBannerAds=NO;
    // Present the scene.*/
    [skView presentScene:scene];
}

-(void)hidesBanner {
    [adView setAlpha:0];
    self.canDisplayBannerAds = NO;
}

-(void)showsBanner {
    [adView setAlpha:1];
    self.canDisplayBannerAds = YES;
    
}

- (void)handleNotification:(NSNotification *)notification{
    if ([notification.name isEqualToString:@"hideAd"]) {
        [self hidesBanner];
    }else if ([notification.name isEqualToString:@"showAd"]) {
        [self showsBanner];
    }
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        return UIInterfaceOrientationMaskAllButUpsideDown;
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end