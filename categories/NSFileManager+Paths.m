//
//  NSFileManager+Paths.m
//
//  Created by Tyler Casselman on 6/6/12.
//  Copyright (c) 2012 Casselman Consulting. All rights reserved.
//

#import "NSFileManager+Paths.h"
//Querying the cache directory is expensive so we memoize it
static NSString *cacheDirectory = nil;
@implementation NSFileManager (Paths)
+ (NSString *)documentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)bundleDirectory{
    return [[NSBundle mainBundle] bundlePath];
}

+ (NSString *)cacheDirectory
{
    if (cacheDirectory == nil) {
        cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    }
    return cacheDirectory;
}

+ (NSString *)tempDirectory
{
    return NSTemporaryDirectory();
}

+ (NSURL *)urlForFilename:(NSString *)filename
{
    return [self urlForFilename:filename extension:nil];
}

+ (NSURL *)urlForFilename:(NSString *)filename extension:(NSString *)extension
{
    NSBundle *classBundle = [NSBundle bundleForClass:[[UIApplication sharedApplication].delegate class]];
    return [classBundle URLForResource:filename withExtension:extension];
}

+ (NSURL *)urlForDocumentsFile:(NSString *)filename
{
    return [NSURL fileURLWithPathComponents:@[[self documentsDirectory], filename]];
}

+ (NSURL *)urlForCachedFile:(NSString *)filename
{
    return [NSURL fileURLWithPathComponents:@[[self cacheDirectory], filename]];
}

+ (NSURL *)urlForTempFile:(NSString *)filename
{
    return [NSURL fileURLWithPathComponents:@[[self tempDirectory], filename]];
}
//This method will first check for a file in the caches directory (our download folder)
//If no file has been downloaded it checks the bundle
//This allows our downloaded files to override those found in the bundle
+ (NSURL *)urlForCachedOrBundledFile:(NSString *)filename
{
    NSURL *fileURL = [self urlForCachedFile:filename];
    
    if (![[self defaultManager] fileExistsAtPath:[fileURL path]]) {
        fileURL = [self urlForFilename:filename];
        //If the file isn't in the bundle or the cache dir, return nil
        if (![[self defaultManager] fileExistsAtPath:[fileURL path]]) {
            fileURL = nil;
        }
    }
    return fileURL;
}
@end
