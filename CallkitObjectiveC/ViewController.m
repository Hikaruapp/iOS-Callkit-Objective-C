//
//  ViewController.m
//  CallkitObjectiveC
//
//  Created by Yanase Yuji on 2016/10/15.
//  Copyright © 2016年 hikaruApp. All rights reserved.
//

#import "ViewController.h"
#import "CallkitController.h"

@interface ViewController ()
- (IBAction)buttonCallState:(id)sender;
@property ( nonatomic ) CallkitController *callkitController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _callkitController = [CallkitController new];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonCallState:(id)sender {
    [self.callkitController callstateNow];
}
@end
