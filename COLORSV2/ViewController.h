//
//  ViewController.h
//  COLORSV2
//

//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <iAd/iAd.h>
#import "TitleScene.h"
#import "MyScene.h"

@interface ViewController : UIViewController <ADBannerViewDelegate>{
    ADBannerView *adView;
}


@end
