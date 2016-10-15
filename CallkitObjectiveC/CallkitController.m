//
//  CallkitController.m
//  CallkitObjectiveC
//
//  Created by Yanase Yuji on 2016/10/15.
//  Copyright © 2016年 hikaruApp. All rights reserved.
//

#import <CallKit/CXCall.h>
#import <CallKit/CXCallObserver.h>

#import "CallkitController.h"

@interface CallkitController ()<CXCallObserverDelegate>
@property ( nonatomic ) CXCallObserver *callObserver;
@end

@implementation CallkitController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // 電話状態変化通知の設定
        _callObserver = [CXCallObserver new];
        [_callObserver setDelegate:self queue:dispatch_get_main_queue()];
        
    }
    return self;
}

// 現在の値の取得
- (void)callstateNow {
    if ([self.callObserver.calls count] == 0) {
        [self callStateValue:nil];
    } else {
        for (CXCall *call in self.callObserver.calls) {
            [self callStateValue:call];
        }
    }
}

#pragma mark - CXCallObserverDelegate
- (void)callObserver:(CXCallObserver *)callObserver callChanged:(CXCall *)call{
    [self callStateValue:call];
}

#pragma mark - Callkit State
- (void)callStateValue:(CXCall *)call {
    
    NSLog(@"hasEnded     %@", call.hasEnded? @"YES":@"NO");
    NSLog(@"isOutgoing   %@", call.isOutgoing? @"YES":@"NO");
    NSLog(@"isOnHold     %@", call.isOnHold? @"YES":@"NO");
    NSLog(@"hasConnected %@", call.hasConnected? @"YES":@"NO");

    
    // 切断
    if (call == nil || call.hasEnded == YES) {
        NSLog(@"CXCallState : Disconnected");
    }
    
    // 発信
    if (call.isOutgoing == YES && call.hasConnected == NO) {
        NSLog(@"CXCallState : Dialing");
    }
    
    // 着信
    if (call.isOutgoing == NO  && call.hasConnected == NO && call.hasEnded == NO && call != nil) {
        NSLog(@"CXCallState : Incoming");
    }
    
    // 電話中
    if (call.hasConnected == YES && call.hasEnded == NO) {
        NSLog(@"CXCallState : Connected");
    }
    
}

@end
