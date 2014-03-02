
#import "AFHTTPSessionManager.h"

@interface VLDFakeHTTPSessionManager : AFHTTPSessionManager

@property (strong, nonatomic) id responseObject;
@property (strong, nonatomic) id error;

- (void) useJSONResponseFromFile: (NSString *) file;

@end