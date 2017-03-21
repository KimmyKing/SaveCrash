//
//  CatchCrash.h
//  捕获crash
//
//  Created by Cain on 16/10/19.
//  Copyright © 2016年 Cain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatchCrash : NSObject

void uncaughtExceptionHandler(NSException *exception);

@end
