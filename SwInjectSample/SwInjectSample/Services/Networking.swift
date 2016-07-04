//
//  Networking.swift
//  SwInjectSample
//
//  Created by Adrian Wu on 04/07/2016.
//  Copyright © 2016 VeganTofu. All rights reserved.
//

import Foundation
import AFNetworking

protocol Networking {
  func getRequest(path:String, successCallback:AnyObject ->() ,  failureCallback:NSError!->() );
}

struct Network:Networking {
  func getRequest(path: String, successCallback: AnyObject -> (), failureCallback: NSError! -> ()) {
    
    let manager = AFHTTPSessionManager()
    manager.responseSerializer = AFJSONResponseSerializer()
    getRequestWithManager(manager, path:path, successCallback:successCallback, failureCallback:failureCallback)
  }
}

func getRequestWithManager(manager: AFHTTPSessionManager, path: String, successCallback: AnyObject -> (), failureCallback: NSError! -> ()) {
  manager.GET(path, parameters: nil, progress: nil, success: { (task, response) in
    successCallback(response!)
    }) { (task, error) in
      failureCallback(error)
  }
}
