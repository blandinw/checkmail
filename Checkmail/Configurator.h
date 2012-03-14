//
//  Configurator.h
//  Checkmail
//
//  Created by Willy Blandin on 13/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configurator : NSObject
+(void)saveConfig:name;
+(NSString*)getConfig;
+(NSString*)pathForDataFile;
@end
