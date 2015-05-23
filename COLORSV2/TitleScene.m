//
//  TitleScene.m
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import "TitleScene.h"


@implementation TitleScene

-(void) didMoveToView:(SKView *)view{
    if (!self.contentCreated){
        [self createSceneContents];
        self.contentCreated=YES;
    }
    //add start button
    SKLabelNode *start = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    start.name = @"startbutton";//how the node is identified later
    [start setFontSize:self.frame.size.width*0.10];
    start.text = @"START!";
    start.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.45);
    start.fontColor =  [UIColor blackColor];
    [self addChild:start];
    
    //add settings button
    SKLabelNode *setting = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    setting.name = @"setting";//how the node is identified later
    [setting setFontSize:self.frame.size.width*0.10];
    setting.text = @"Settings";
    setting.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.30);
    setting.fontColor =  [UIColor blackColor];
    [self addChild:setting];
    
    //add high score
    SKLabelNode *high = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    high.name = @"highscore";//how the node is identified later
    [high setFontSize:self.frame.size.width*0.10];
    high.text = @"Highscores";
    high.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.15);
    high.fontColor =  [UIColor blackColor];
    [self addChild:high];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
     if ([node.name isEqualToString:@"startbutton"]) {
        SKScene *myScene = [[levelselect alloc] initWithSize:self.size];
        [self.view presentScene:myScene transition:NULL];
    }else  if ([node.name isEqualToString:@"setting"]) {
        SKScene *myScene = [[settings alloc] initWithSize:self.size];
        [self.view presentScene:myScene transition:NULL];
    }else if([node.name isEqualToString:@"highscore"]){
        SKScene *myScene = [[highscore alloc] initWithSize:self.size];
        [self.view presentScene:myScene transition:NULL];
    }else{
        return;
    }
}

-(void) createSceneContents{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil]; 
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568|| screenBounds.size.height==480) {
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
    SKLabelNode *c = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand Bold"];
    c.name = @"c";//how the node is identified later
    [c setFontSize:self.frame.size.width*0.3];
    c.text = @"C";
    c.position = CGPointMake(self.frame.size.width*.28, self.frame.size.height*0.65);
    c.fontColor =  [UIColor magentaColor];
    [self addChild:c];
    //o
    SKLabelNode *o = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand Bold"];
    o.name = @"o";//how the node is identified later
    [o setFontSize:self.frame.size.width*0.3];
    o.text = @"o";
    o.position = CGPointMake(self.frame.size.width*.4, self.frame.size.height*0.65);
    o.fontColor =  [UIColor greenColor];
    [self addChild:o];
    //l
    SKLabelNode *l = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand Bold"];
    l.name = @"l";//how the node is identified later
    [l setFontSize:self.frame.size.width*0.3];
    l.text = @"l";
    l.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.65);
    l.fontColor =  [UIColor cyanColor];
    [self addChild:l];
    //o
    SKLabelNode *oh = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand Bold"];
    oh.name = @"oh";//how the node is identified later
    [oh setFontSize:self.frame.size.width*0.3];
    oh.text = @"o";
    oh.position = CGPointMake(self.frame.size.width*.6, self.frame.size.height*0.65);
    oh.fontColor =  [UIColor blueColor];
    [self addChild:oh];
    //r
    SKLabelNode *r = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand Bold"];
    r.name = @"r";//how the node is identified later
    [r setFontSize:self.frame.size.width*0.3];
    r.text = @"r";
    r.position = CGPointMake(self.frame.size.width*.7, self.frame.size.height*0.65);
    r.fontColor =  [UIColor yellowColor];
    [self addChild:r];
    //s
    SKLabelNode *s = [SKLabelNode labelNodeWithFontNamed:@"Bradley Hand Bold"];
    s.name = @"s";//how the node is identified later
    [s setFontSize:self.frame.size.width*0.3];
    s.text = @"s";
    s.position = CGPointMake(self.frame.size.width*.8, self.frame.size.height*0.65);
    s.fontColor =  [UIColor redColor];
    [self addChild:s];
}
@end

