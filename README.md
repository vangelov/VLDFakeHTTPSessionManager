VLDFakeHTTPSessionManager
========================

VLDFakeHTTPSessionManager is a AFHTTPSessionManager subclass with the ability to set custom response object and error. 
It's primary purpose is to help unit testing the service layer of the application. The completion handler is called synchronously so there's no latency when running the tests. More information can be found in the Example folder.
