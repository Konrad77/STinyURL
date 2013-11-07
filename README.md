STinyURL
========

Shorten URL with TinyUrl synchronous and asynchronous.

How to use:

**Synchronous**
 ```objectivec
	NSString *longUrl = @"http://www.spelnyheterna.se/Nyhet/1804/Lagg-undan-mobilen";
	NSError *error = nil;
	NSString *shortUrl = [STinyURL shortenUrl:longUrl 
						error:&error];


**Asynchronous**

	NSString *longUrl = @"http://www.spelnyheterna.se/Nyhet/1804/Lagg-undan-mobilen";
	[STinyURL shortenUrlAsync:longUrl
	        completionHandler:^(NSString *shortenUrl) {
	              	//ShortenUrl
      	}];
