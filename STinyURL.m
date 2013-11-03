//
//  STinyURL.m
//  spelnyheterna
//
//  Created by Mikael Konradsson on 2013-11-02.
//
//

#import "STinyURL.h"

@implementation STinyURL

+ (NSString*)shortenUrl:(NSString*)urlToShorten
                  error:(NSError**)error {
    
    NSString *requestUrl = [@"http://tinyurl.com/api-create.php?url=" stringByAppendingString:urlToShorten];
    NSString *shortenedUrl =  [NSString stringWithContentsOfURL:[NSURL URLWithString:requestUrl]
                                                       encoding:NSUTF8StringEncoding
                                                          error:error];
    return shortenedUrl;
}

+ (void)shortenUrlAsync:(NSString*)urlToShorten
      completionHandler:(UrlShortenedResult)shortenResult {
    
    NSString *requestUrl = [@"http://tinyurl.com/api-create.php?url=" stringByAppendingString:urlToShorten];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error = nil;
        NSString *shortURL =  [NSString stringWithContentsOfURL:[NSURL URLWithString:requestUrl]
                                                           encoding:NSUTF8StringEncoding
                                                              error:&error];
        if (shortURL.length != 0 && error == nil){
            shortenResult(shortURL);
        } else {
            shortenResult(urlToShorten);
        }
    });
}

@end
