//
//  ViewController.m
//  マインスイーパー
//
//  Created by 拓人 吉開 on 12/02/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CALay.h"
#import <QuartzCore/QuartzCore.h>
@implementation ViewController
@synthesize label;


-(int)examine:(CALayer *)layer{
    CGPoint pos = layer.position;
    int i = 0;
    pos.y -= 80;
    CALayer *test = [self.view.layer hitTest:pos];
    if([test.name isEqualToString:@"mine"]){
        i++;
    }
    pos.x += 80;
    test = [self.view.layer hitTest:pos];
    if([test.name isEqualToString:@"mine"]){
        i++;
    }
    pos.y += 80;
    test = [self.view.layer hitTest:pos];
    if([test.name isEqualToString:@"mine"]){
        i++;
    }
    pos.y += 80;
    test = [self.view.layer hitTest:pos];
    if([test.name isEqualToString:@"mine"]){
        i++;
    }
    pos.x -= 80;
    test = [self.view.layer hitTest:pos];
    if([test.name isEqualToString:@"mine"]){
        i++;
    }
    pos.x -= 80;
    test = [self.view.layer hitTest:pos];
    if([test.name isEqualToString:@"mine"]){
        i++;
    }
    pos.y -= 80;
    test = [self.view.layer hitTest:pos];
    if([test.name isEqualToString:@"mine"]){
        i++;
    }
    pos.y -= 80;
    test = [self.view.layer hitTest:pos];
    if([test.name isEqualToString:@"mine"]){
        i++;
    }
    return i;
}
-(void)setMine{
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
            CALayer *layer = [CALayer layer];
            layer.contents = (id)[UIImage imageNamed:@"mass3.png"].CGImage;
            layer.name = @"mass";
            layer.bounds = CGRectMake(0, 0, 80, 80);
            layer.position = CGPointMake(50 + 80 * i, 50 + 80 * j);
            [self.view.layer addSublayer:layer];
        }
    }
    for(int a = 0; a < 10; a++){
        int rW = arc4random() % 9;
        int rH = arc4random() % 9;
        CGPoint pos = CGPointMake(50 + 80 * rW, 50 + 80 * rH);
        CALayer *test = [self.view.layer hitTest:pos];
        if([test.name isEqualToString:@"mine"]){
            a--;
        }
        test.name = @"mine";
    }
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
            CGPoint pos = CGPointMake(50 + 80 * i, 50 + 80 * j);
            CALayer *test2 = [self.view.layer hitTest:pos];
            if(![test2.name isEqualToString:@"mine"]){
                int g = [self examine:test2];
                if(g == 0){
                    test2.name = @"nil";
                } else{
                    test2.name = [NSString stringWithFormat:@"%d", g];
                }
            }
        }
    }
}

-(void)check:(CALayer *)layer{
    if(layer.contents == (id)[UIImage imageNamed:@"batu.png"].CGImage){
        return;
    }
    if([layer.name isEqualToString:@"sumi"]){
        return;
    } else if([layer.name isEqualToString:@"nil"]){
        layer.contents = (id)[UIImage imageNamed:@"math2.png"].CGImage;
        layer.name = @"sumi";
        CGPoint pos = layer.position;
        pos.y -= 80;
        CALayer *test = [self.view.layer hitTest:pos];
        [self check:test];
        pos.x += 80;
        test = [self.view.layer hitTest:pos];
        [self check:test];
        pos.y += 80;
        test = [self.view.layer hitTest:pos];
        [self check:test];
        pos.y += 80;
        test = [self.view.layer hitTest:pos];
        [self check:test];
        pos.x -= 80;
        test = [self.view.layer hitTest:pos];
        [self check:test];
        pos.x -= 80;
        test = [self.view.layer hitTest:pos];
        [self check:test];
        pos.y -= 80;
        test = [self.view.layer hitTest:pos];
        [self check:test];
        pos.y -= 50;
        test = [self.view.layer hitTest:pos];
        [self check:test];
    } else if([layer.name isEqualToString:@"mine"]){
        return;
    } else if(![layer.name isEqualToString:@"self"]){
        layer.contents = (id)[UIImage imageNamed:[NSString stringWithFormat:@"num%@.png", layer.name]].CGImage;
        layer.name = @"sumi";
    }
}
-(void)chengeImage:(CALayer *)layer{
    CGPoint pos = layer.position;
    CALayer *test = [self.view.layer hitTest:pos];
    NSString *st = [NSString stringWithFormat:@"num%@.png", test.name];
    if(test.contents == (id)[UIImage imageNamed:@"batu.png"].CGImage){
        return;
    }
    if([test.name isEqualToString:@"mine"]){
        label.text = @"GAMEOVER";
        [self setMine];
        return;
    } else if([test.name isEqualToString:@"sumi"]){
        return;
    } else if([test.name isEqualToString:@"nil"]){
        //test.contents = (id)[UIImage imageNamed:@"math2.png"].CGImage;
        [self check:test];
        
        //test.name = @"sumi";
        return;
    }
    test.contents = (id)[UIImage imageNamed:st].CGImage;
    test.name = @"sumi";
}

-(void)check2{
    int tuka = 0;
    CALayer *test;
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
            test = [self.view.layer hitTest:CGPointMake(50 + 80 * i, 50 + 80 * j)];
            if([test.name isEqualToString:@"sumi"]){
                tuka++;
            }
        }
    }
    if(tuka == 71){
        label.text = @"おめでとう";
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    pos1 = [[touches anyObject]locationInView:self.view];
    B = YES;
}

-(void)LP{
    CALayer *test = [self.view.layer hitTest:pos1];
    if([test.name isEqualToString:@"sumi"]){
        return;
    }
    if(q == 0){
        if(test.contents == (id)[UIImage imageNamed:@"batu.png"].CGImage){
            test.contents = (id)[UIImage imageNamed:@"mass3.png"].CGImage;
        } else{
            test.contents = (id)[UIImage imageNamed:@"batu.png"].CGImage;
        }
        q = 1;
    } else{
        q = 0;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint pos = [[touches anyObject]locationInView:self.view];
    CALayer *test = [self.view.layer hitTest:pos];
    pos1 = test.position;
    NSLog(@"%@", test.name);
    [self chengeImage:test];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    q = 0;
    UILongPressGestureRecognizer *longpress = [[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LP)]autorelease];
    [self.view addGestureRecognizer:longpress];
    self.view.layer.name = @"self";
    [self setMine];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [label release];
    [super dealloc];
}
@end
