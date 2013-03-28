#import "AFIncrementalStore.h"
#import "AFRestClient.h"

@interface FSTestSDKAPIClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (FSTestSDKAPIClient *)sharedClient;

@end
