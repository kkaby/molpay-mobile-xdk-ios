** Please check the example for the workaround implementations

Announcement from MOLPay: iOS SSL failed workaround.

If any of you experienced SSL connections issues with a console error log shown below:
NSURLSession/NSURLConnection HTTP load failed (kCFStreamErrorDomainSSL, -9843)

Please use this workaround at your ViewController.m where you present the MOLPay Payment UI (Add it below the last import statement, recompile and try again:

@implementation NSURLRequest (NSURLRequestWithIgnoreSSL)

+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
   return YES;
}

@end


* Please take note that this is just a workaround, it must not be use in a production app due to possible AppStore reject. This workaround is only required during this event.

Thank you.

MOLPay mobile team