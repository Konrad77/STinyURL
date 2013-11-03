//
//  STinyURL.h
//  spelnyheterna
//
//  Created by Mikael Konradsson on 2013-11-02.
//
//

#import <Foundation/Foundation.h>

typedef void (^UrlShortenedResult)(NSString *shortenUrl);

@interface STinyURL : NSObject

+ (NSString*)shortenUrl:(NSString*)urlToShorten
                  error:(NSError**)error;

+ (void)shortenUrlAsync:(NSString*)urlToShorten
      completionHandler:(UrlShortenedResult)shortenResult;

@end
