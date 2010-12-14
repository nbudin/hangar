//
//  WorkaroundURLProtocol.m
//  MacOnRack
//
//  Created by Nat Budin on 12/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WorkaroundURLProtocol.h"


@implementation WorkaroundURLProtocol
- (id)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id <NSURLProtocolClient>)client
{
	CFRetain(client);
	
	return [super initWithRequest:request
				  cachedResponse:cachedResponse
						   client:client];
}
@end
