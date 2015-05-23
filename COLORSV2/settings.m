//
//  settings.m
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import "settings.h"


@implementation settings
-(void) didMoveToView:(SKView *)view{
    if (!self.contentCreated){
        [self createSceneContents];
        self.contentCreated=YES;
    }
    //add sound switch
    NSUserDefaults* defaults  = [NSUserDefaults standardUserDefaults];
    switch1 = [[UISwitch alloc] initWithFrame:CGRectZero];
    switch1.on = [defaults boolForKey: K_SWITCH_KEY];
    SKLabelNode *sound = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    sound.name = @"sound";//how the node is identified later
    [sound setFontSize:self.frame.size.width*0.10];
    sound.text = @"SOUND";
    sound.position = CGPointMake(self.frame.size.width*.15, self.frame.size.height*0.7);
    sound.fontColor =  [UIColor blackColor];
    [self addChild:sound];
    
    switch1.center=CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.3);
    [switch1 addTarget:self action:@selector(toggleEnabled:) forControlEvents:UIControlEventValueChanged];
    [view insertSubview:switch1 atIndex:[[view subviews] count]];
    
    //add rate button
    SKLabelNode *rate = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    rate.name = @"rate";//how the node is identified later
    [rate setFontSize:self.frame.size.width*0.10];
    rate.text = @"RATE";
    rate.position = CGPointMake(self.frame.size.width*.15, self.frame.size.height*0.5);
    rate.fontColor =  [UIColor blackColor];
    [self addChild:rate];
    
    //add back button
    SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    back.name = @"backbutton";//how the node is identified later
    [back setFontSize:self.frame.size.width*0.10];
    back.text = @"BACK";
    back.position = CGPointMake(self.frame.size.width*.15, self.frame.size.height*0.9);
    back.fontColor =  [UIColor blackColor];
    [self addChild:back];
    
    //add verision
    SKLabelNode *version = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    version.name = @"version";//how the node is identified later
    [version setFontSize:self.frame.size.width*0.05];
    version.text = @"Version: 2.1";
    version.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*.01);
    version.fontColor =  [UIColor blackColor];
    [self addChild:version];
}

//handle touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    
    if ([node.name isEqualToString:@"backbutton"]) {
        switch1.hidden=YES;
        SKScene *myScene = [[TitleScene alloc] initWithSize:self.size];
        [self.view presentScene:myScene transition:NULL];
    }else if ([node.name isEqualToString:@"rate"]){
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://itunes.apple.com/us/app/colors-tile-match/id905220060?ls=1&mt=8"]];
    }else{
        return;
    }
}

-(IBAction)toggleEnabled:(id)sender{
    NSLog(@"working");
    if (switch1.on)
        sound = YES;
    else
        sound = NO;
    NSUserDefaults* defaults  = [NSUserDefaults standardUserDefaults];
    [defaults setBool: sound forKey: K_SWITCH_KEY];
    [defaults synchronize];
    
}

-(void) createSceneContents{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil]; 
    NSUserDefaults* defaults  = [NSUserDefaults standardUserDefaults];
    switch1.on = [defaults boolForKey: K_SWITCH_KEY];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568||screenBounds.size.height==480) {
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"color@2x.png"];
        [_background setName:@"background"];
        _background.size=self.frame.size;
        _background.position = (CGPoint) {self.frame.size.width*.5, self.frame.size.height*.5};
        [self addChild:_background];
    }else{
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"coloripad@2x.png"];
        [_background setName:@"background"];
        _background.size=self.frame.size;
        _background.position = (CGPoint) {self.frame.size.width*.5, self.frame.size.height*.5};
        [self addChild:_background];
    }
}

@end
