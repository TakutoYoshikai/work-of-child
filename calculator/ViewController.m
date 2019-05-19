//
//  ViewController.m
//  電卓2
//
//  Created by 拓人 吉開 on 12/01/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation ViewController
@synthesize textfield;
@synthesize B1;
-(void)plusnum:(int)i{
    if(b == NO){    //小数点が付いていない時
        if([textfield.text isEqualToString:@"-0"]){ //テキストフィールドのテキストが-0だったら
            textfield.text = [NSString stringWithFormat:@"-%d", i];
            return;
        }
        if(b2 == YES){  //イコールがおされた直後だったらYES
            b2 = NO;
            num2 = 0;
            textfield.text = @"";
        }
        if(NM == YES){  //テキストフィールドに-があったら
            textfield.text = [NSString stringWithFormat:@"%@%d", textfield.text, i];
        } 
        else if([textfield.text isEqualToString:@"0"] || [textfield.text hasSuffix:@"+"] == YES || [textfield.text hasSuffix:@"-"] == YES || [textfield.text hasSuffix:@"×"] == YES || [textfield.text hasSuffix:@"÷"] == YES){
            textfield.text = [NSString stringWithFormat:@"%d", i];
        }  else{
            textfield.text = [NSString stringWithFormat:@"%@%d", textfield.text, i];
        }
        numright = [[textfield text]doubleValue];   //式の右辺の値をテキストフィールドの数値にする
        if(numright >= 32767){ //数値が変数の大きさを超えたらアラートをだす
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"数値が大きすぎます" message:@"この数値を一旦削除します" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            textfield.text = @"0";
        }
    } else{ //小数点が付いている時
        textfield.text = [NSString stringWithFormat:@"%@%d", textfield.text, i];
        numright = [[textfield text]doubleValue];
    }
}

-(IBAction)minusnum{
    if(NM == NO){   //-が付いていないとき
        NM = YES;
        if(b2 == YES){
            num2 = 0;
            b2 = NO;
            textfield.text = @"-";
            b2 = NO;
            return;
        }
        if([textfield.text isEqualToString:@"0"] || [textfield.text hasSuffix:@"+"] == YES || [textfield.text hasSuffix:@"-"] == YES || [textfield.text hasSuffix:@"×"] == YES || [textfield.text hasSuffix:@"÷"] == YES){
            textfield.text = @"-";
            b2 = NO;
            return;
        }
    } else{
        NM = NO;
        if([textfield.text isEqualToString:@"0"] || [textfield.text hasSuffix:@"+"] == YES || [textfield.text hasSuffix:@"-"] == YES || [textfield.text hasSuffix:@"×"] == YES || [textfield.text hasSuffix:@"÷"] == YES){
            textfield.text = @"0";
            numright = [[textfield text]doubleValue];
            return;
        }
    }
    textfield.text = [NSString stringWithFormat:@"%g", [[textfield text]doubleValue] * -1];
    numright = [[textfield text]doubleValue];
}

-(IBAction)syosu{
    if([textfield.text hasSuffix:@"+"] == YES || [textfield.text hasSuffix:@"-"] == YES || [textfield.text hasSuffix:@"×"] == YES || [textfield.text hasSuffix:@"÷"] == YES){
        return;
    } else if(b2 == YES){
        textfield.text = @"0.";
        b = YES;
    }
    NSRange range = [textfield.text rangeOfString:@"."];
    if(range.location == NSNotFound){    //小数点が付いていないときに
        b = YES;    
        textfield.text = [NSString stringWithFormat:@"%@.", textfield.text];
    }
}
-(void)mark:(int)i{
    numright = [[textfield text]doubleValue];
    if([textfield.text isEqualToString:@"-"]){
        return;
    }
    if(b2 == YES){  //イコールが押された直後だったら記号を0(無効)にする
        b2 = NO;
        num2 = 0;
    }
    switch (num2) {
        case 0:
            num = numright;
            break;
        case 1:
            num += numright;
            break;
        case 2:
            num -= numright;
            break;
        case 3:
            num *= numright;
            break;
        case 4:
            num /= numright;
            break;
        default:
            break;
    }
    switch (i) {
        case 1:
            textfield.text = [NSString stringWithFormat:@"%g+", numright];
            break;
        case 2:
            textfield.text = [NSString stringWithFormat:@"%g-", numright];
            break;
        case 3:
            textfield.text = [NSString stringWithFormat:@"%g×", numright];
            break;
        case 4:
            textfield.text = [NSString stringWithFormat:@"%g÷", numright];
            break;
        default:
            break;
    }
    
    num2 = i;
    b = NO;
    NM = NO;
}
-(IBAction)equal{
    switch (num2) {
        case 1:
            num += numright;
            break;
        case 2:
            num -= numright;
            break;
        case 3:
            num *= numright;
            break;
        case 4:
            num /= numright;
            break;
        default:
            break;
    }
    //num2 = 0;
    textfield.text = [NSString stringWithFormat:@"%g", num];
    b = NO; //小数点をなかったことにする
    b2 = YES;   //イコールを押したらYESにする
    NM = NO;
}

-(IBAction)plus{
    [self mark:1];
}

-(IBAction)minus{
    [self mark:2];
}

-(IBAction)kakeru{
    [self mark:3];
}

-(IBAction)waru{
    [self mark:4];
}

-(IBAction)one{
    [self plusnum:1];
}

-(IBAction)two{
    [self plusnum:2];
}

-(IBAction)three{
    [self plusnum:3];
}

-(IBAction)four{
    [self plusnum:4];
}

-(IBAction)five{
    [self plusnum:5];
}

-(IBAction)six{
    [self plusnum:6];
}

-(IBAction)seven{
    [self plusnum:7];
}

-(IBAction)eight{
    [self plusnum:8];
}

-(IBAction)nine{
    [self plusnum:9];
}

-(IBAction)zero{
    [self plusnum:0];
}

-(IBAction)C{
    textfield.text = @"0";
    numright = 0;
    b = NO;
    NM = NO;
}

-(IBAction)AC{
    textfield.text = @"0";
    numright = 0;
    num2 = 0;
    num = 0;
    b = NO;
    NM = NO;
}

-(IBAction)ruto{
    if(b2 == YES){
        num2 = 0;
    }
    if([textfield.text hasSuffix:@"+"] == YES || [textfield.text hasSuffix:@"-"] == YES || [textfield.text hasSuffix:@"×"] == YES || [textfield.text hasSuffix:@"÷"] == YES){
        return;
    }
    numright = [[textfield text]doubleValue];
    switch (num2) {
        case 0:
            num = numright;
            break;
        case 1:
            num += numright;
            break;
        case 2:
            num -= numright;
            break;
        case 3:
            num *= numright;
            break;
        case 4:
            num /= numright;
            break;
        default:
            break;
    }
    num = sqrt(num);
    textfield.text = [NSString stringWithFormat:@"%g", num];
    b = NO;
    b2 = YES;
    NM = NO;
    num2 = 0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)cheimg{
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    textfield.text = @"0";
    num = 0;
    num2 = 0;
    numright = 0;
    b = NO;
    b2 = NO;
    self.view.layer.contents = (id)[UIImage imageNamed:@"D.JPG"].CGImage;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTextfield:nil];
    [self setB1:nil];
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
    [textfield release];
    [B1 release];
    [super dealloc];
}
@end
