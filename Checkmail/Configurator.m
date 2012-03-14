//
//  Configurator.m
//  Checkmail
//
//  Created by Willy Blandin on 13/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import "Configurator.h"

@implementation Configurator
+(NSString *)pathForDataFile
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *folder = @"~/Library/Application Support/Checkmail/";
    folder = [folder stringByExpandingTildeInPath];
    
    if ([fileManager fileExistsAtPath: folder] == NO) {
        [fileManager createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *fileName = @"account.txt";
    return [folder stringByAppendingPathComponent: fileName];    
}

+(void)saveConfig:(NSString*)name
{
    NSString* path = [self pathForDataFile];
    FILE *fp = fopen([path UTF8String], "w+");
    
    fputs([name UTF8String], fp);
    
    fclose(fp);
}

+(NSString*)getConfig
{
    NSString* path = [self pathForDataFile];
    FILE *fp = fopen([path UTF8String], "r");
    
    if (fp == NULL) {
        return nil;
    }
    
    char buffer[128];
    fgets(buffer, sizeof(buffer), fp);
    fclose(fp);
    
    size_t len = strlen(buffer);
    if (buffer[len - 1] == '\n') {
        buffer[len - 1] = '\0';
    }
    
    return [NSString stringWithUTF8String:buffer];
}
@end
