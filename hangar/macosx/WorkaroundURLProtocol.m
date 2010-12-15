//
//  WorkaroundURLProtocol.m
//  Hangar
//
//  Created by Nat Budin on 12/14/10.
//

#import "WorkaroundURLProtocol.h"


@implementation WorkaroundURLProtocol

//  Works around http://openradar.appspot.com/8087384
- (id)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id <NSURLProtocolClient>)client
{
	CFRetain(client);
	
	return [super initWithRequest:request
				  cachedResponse:cachedResponse
						   client:client];
}
@end
