//
//  NSFileManager+Paths.h
//  bestbuy_catalog
//
//  Created by Tyler Casselman on 6/6/12.
//  Copyright (c) 2012 Sequence. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 * Easy access to common folders.
 */
@interface NSFileManager (Paths)
+ (NSString *)documentsDirectory;
+ (NSString *)bundleDirectory;
+ (NSString *)cacheDirectory;
+ (NSString *)tempDirectory;
+ (NSURL *)urlForFilename:(NSString *)filename;
+ (NSURL *)urlForFilename:(NSString *)filename extension:(NSString *)extension;
+ (NSURL *)urlForDocumentsFile:(NSString *)filename;
+ (NSURL *)urlForCachedFile:(NSString *)filename;
+ (NSURL *)urlForTempFile:(NSString *)filename;
+ (NSURL *)urlForCachedOrBundledFile:(NSString *)filename;
@end
