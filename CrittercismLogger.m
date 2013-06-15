//
//  CrittercismLogger.m
//  CalmApp
//
//  Created by Tyler Casselman on 4/17/13.
//  Copyright (c) 2013 Calm. All rights reserved.
//

#import "CrittercismLogger.h"
#import "Crittercism.h"

@implementation CrittercismLogger
- (void)logMessage:(DDLogMessage *)logMessage
{
#if !DEBUG
    [Crittercism leaveBreadcrumb:logMessage->logMsg];
#endif
}

@end
