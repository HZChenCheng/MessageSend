//
//  Student.m
//  MessageSend
//
//  Created by Apple on 2019/1/17.
//  Copyright © 2019 Chen. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student

#pragma mark - 消息转发机制 第1阶段：动态方法解析

/// 调用了实例方法
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
//    if ([NSStringFromSelector(sel) isEqualToString:@"study"]) {
//        class_addMethod([Student class], sel, (IMP)dynamicMethodIMP, "v@:");
//    }
    return [super resolveInstanceMethod:sel];
}

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"动态添加了方法\"%@\"", NSStringFromSelector(_cmd));
}

/// 调用了类方法
+ (BOOL)resolveClassMethod:(SEL)sel {
    return [super resolveClassMethod:sel];
}

#pragma mark - 消息转发机制 第2阶段：备援接收者
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if ([NSStringFromSelector(aSelector) isEqualToString:@"study"]) {
//        return [[People alloc] init];
//    }
    return nil;
}

#pragma mark - 消息转发机制 第3阶段：消息未能处理

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:*"];
    }
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = invocation.selector;
    if([self respondsToSelector:sel]) {
        [invocation invokeWithTarget:self];
    } else {
        [self doesNotRecognizeSelector:sel];
    }
}

@end
