//
//  Checker.m
//  checkmail
//
//  Created by Willy Blandin on 12/03/2012.
//  Copyright (c) 2012 DomoHood. All rights reserved.
//

#import "Checker.h"

@implementation Checker
-(NSUInteger)checkWithUsername:(NSString*)username
                      password:(NSString*)password {
    NSLog(@"Connecting... ㅋㅋㅋㅋ");
    
    CTCoreAccount *account = [[CTCoreAccount alloc] init];
    [account connectToServer:@"imap.gmail.com"
                        port:993
              connectionType:CONNECTION_TYPE_TLS
                    authType:IMAP_AUTH_TYPE_PLAIN
                       login:username
                    password:password];

    CTCoreFolder *inbox = [account folderWithPath:@"INBOX"];
    NSUInteger count = [inbox unreadMessageCount];
    
    [account disconnect];
    
    NSLog(@"Unread: %lu", count);
    
    return count;
}

+(Checker*)instance {
    if (!checkerInstance) {
        checkerInstance = [[self alloc] init];
    }
    
    return checkerInstance;
}
@end
