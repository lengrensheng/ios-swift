//
//  VideoCutter.swift
//  day_ten
//
//  Created by meizu on 16/8/24.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit
import AVFoundation

public class VideoCutter:NSObject{
    public func copyVideoWithUrl(videoUrl url:NSURL,startTime:CGFloat,duration:CGFloat,completion:((videoPath:NSURL?,error:NSError?)->Void)?){
        //复制视频
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)){
            
            let asset = AVURLAsset(URL: url,options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            let paths:NSArray = NSSearchPathForDirectoriesInDomains(.DesktopDirectory, .UserDomainMask, true)
            var outputURL = paths.objectAtIndex(0) as! String
            let manager = NSFileManager.defaultManager()
            do {
                try manager.createDirectoryAtPath(outputURL, withIntermediateDirectories: true, attributes: nil)
            }catch _{
            }
            outputURL = outputURL.convert.stringByAppendingPathComponent("output.mp4")
            do {
                try manager.removeItemAtPath(outputURL)
            }catch _{
            }
            if let exportSession = exportSession as AVAssetExportSession?{
                exportSession.outputURL = NSURL(fileURLWithPath: outputURL)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileTypeMPEG4
                let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                let range = CMTimeRangeMake(start, duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronouslyWithCompletionHandler{
                    () -> Void in switch exportSession.status {
                    case AVAssetExportSessionStatus.Completed:
                        completion?(videoPath:exportSession.outputURL,error:nil)
                    case AVAssetExportSessionStatus.Failed:
                        print("Failed \(exportSession.error)")
                    case AVAssetExportSessionStatus.Cancelled:
                        print("Cancle \(exportSession.error)")
                    default:
                        print("default case")
                    }
                }
            }
        }
    }
}
extension String{
    var convert:NSString {return self as String}
}