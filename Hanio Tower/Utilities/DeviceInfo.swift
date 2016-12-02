//
//  DeviceInfo.swift
//  iOSBaseProject
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

public struct DeviceInfo {
    /// Returns true if it's simulator and not a device
    public static var isSimulator: Bool {
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            return true
        #else
            return false
        #endif
    }
    
    /// Returns true if its on a device and not a simulator
    public static var isDevice: Bool {
        return !isSimulator
    }
    /// The system version without the subversion. Example: 7.0
    public static var systemVersion: String {
        return UIDevice.current.systemVersion as String
    }
    /// The device platform string. Example: "iPhone3,2"
    public static var platform: String {
        var size = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: size)
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }
    /// The user-friendly device platform string. Example: "iPad Air (Cellular)"
    public static var platformForUser: String {
        switch platform {
        //  iPhone
        case "iPhone1,1": return "iPhone 2G"
        case "iPhone1,2": return "iPhone 3G"
        case "iPhone2,1": return "iPhone 3GS"
        case "iPhone3,1": return "iPhone 4"
        case "iPhone3,3": return "iPhone 4 (CDMA)"
        case "iPhone4,1": return "iPhone 4S"
        case "iPhone5,1": return "iPhone 5 (GSM)"
        case "iPhone5,2": return "iPhone 5 (CDMA)"
        case "iPhone5,3": return "iPhone 5C (GSM)"
        case "iPhone5,4": return "iPhone 5C (Global)"
        case "iPhone6,1": return "iPhone 5S (GSM)"
        case "iPhone6,2": return "iPhone 5S (Global)"
        case "iPhone7,1": return "iPhone 6 Plus"
        case "iPhone7,2": return "iPhone 6"
        case "iPhone8,1": return "iPhone 6s"
        case "iPhone8,2": return "iPhone 6s Plus"
        //  iPod
        case "iPod1,1": return "iPod Touch 1G"
        case "iPod2,1": return "iPod Touch 2G"
        case "iPod3,1": return "iPod Touch 3G"
        case "iPod4,1": return "iPod Touch 4G"
        case "iPod5,1": return "iPod Touch 5G"
        //  iPad
        case "iPad1,1": return "iPad 1"
        case "iPad2,1": return "iPad 2 (WiFi)"
        case "iPad2,2": return "iPad 2 (GSM)"
        case "iPad2,3": return "iPad 2 (CDMA)"
        case "iPad2,4": return "iPad 2 (32nm)"
        case "iPad2,5": return "iPad mini (WiFi)"
        case "iPad2,6": return "iPad mini (GSM)"
        case "iPad2,7": return "iPad mini (CDMA)"
        case "iPad3,1": return "iPad 3 (WiFi)"
        case "iPad3,2": return "iPad 3 (CDMA)"
        case "iPad3,3": return "iPad 3 (GSM)"
        case "iPad3,4": return "iPad 4 (WiFi)"
        case "iPad3,5": return "iPad 4 (GSM)"
        case "iPad3,6": return "iPad 4 (CDMA)"
        case "iPad4,1": return "iPad Air (WiFi)"
        case "iPad4,2": return "iPad Air (Cellular)"
        case "iPad4,3": return "iPad Air (China)"
        case "iPad4,4": return "iPad mini 2 (WiFi)"
        case "iPad4,5": return "iPad mini 2 (Cellular)"
        case "iPad4,6": return "iPad mini 2 (China)"
        case "iPad4,7": return "iPad mini 3 (WiFi)"
        case "iPad4,8": return "iPad mini 3 (Cellular)"
        case "iPad4,9": return "iPad mini 3 (China)"
        case "iPad5,3": return "iPad Air 2 (WiFi)"
        case "iPad5,4": return "iPad Air 2 (Cellular)"
        //  simulator
        case "i386": return "Simulator i386"
        case "x86_64": return "Simulator x86_64"
        default: return platform;
        }
    }
    /// Check if the current device is an iPhone
    public static var isiPhone: Bool {
        return platform.hasPrefix("iPhone")
    }
    /// Check if the current device is an iPad
    public static var isiPad: Bool {
        return platform.hasPrefix("iPad")
    }
    /// Check if the current device is an iPod
    public static var isiPod: Bool {
        return platform.hasPrefix("iPod")
    }
    /// Check if the current device has a Retina display
    public static var isRetina: Bool {
        let screen = UIScreen.main
        return screen.responds(to: #selector(UIScreen.displayLink(withTarget:selector:))) && screen.scale >= 2.0
    }
    /// Check if the current device has a Retina HD display
    public static var isRetinaHD: Bool {
        let screen = UIScreen.main
        return screen.responds(to: #selector(UIScreen.displayLink(withTarget:selector:))) && screen.scale >= 3.0
    }
    /// The current device RAM size
    public static var ramSize: Int {
        return self.p_systemInfomation(HW_MEMSIZE)
    }
    /// The current device CPU number
    public static var cpuNumber: Int {
        return self.p_systemInfomation(HW_NCPU)
    }
    /// The current device total memory
    public static var totalMemory: Int {
        return self.p_systemInfomation(HW_PHYSMEM)
    }
    /// The current device non-kernel memory
    public static var userMemory: Int {
        return self.p_systemInfomation(HW_USERMEM)
    }
    /// The current device total disk space
    public static var totalDiskSpace: Int {
        do {
            let fattributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
            return (fattributes[FileAttributeKey.systemSize] as! NSNumber).intValue
        }
        catch let error as NSError {
            dLog(error)
        }
        return 0
    }
    /// The current device free disk space
    public static var freeDiskSpace: Int {
        do {
            let fattributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())
            return (fattributes[FileAttributeKey.systemFreeSize] as! NSNumber).intValue
        }
        catch let error as NSError {
            dLog(error)
        }
        return 0
    }
    // MARK:  -ToDo The current device MAC address
    
    /// Generate an unique identifier and store it into standardUserDefaults
    public static var uniqueIdentifier: String {
        var uuid: String = ""
        if UIDevice.current.responds(to: #selector(getter: UIDevice.identifierForVendor)) {
            uuid = (UIDevice.current.identifierForVendor?.uuidString)!
        } else {
            let defaults = UserDefaults.standard
            if let saved = defaults.object(forKey: UniqueIdentifierDefaultsKey) {
                uuid = saved as! String
            } else {
                uuid = self.p_generateUUID()
                defaults.set(uuid, forKey: UniqueIdentifierDefaultsKey)
            }
        }
        return uuid
    }
}

//Mark: private
private extension DeviceInfo {
    
    static let UniqueIdentifierDefaultsKey = "UniqueIdentifierDefaultsKey"
    
    static func p_systemInfomation(_ type: Int32) -> Int {
        var size: size_t = MemoryLayout<Int>.size
        var results: Int = 0
        var mib: [Int32] = [CTL_HW, type]
        sysctl(&mib, 2, &results, &size, nil, 0)
        return results
    }
    
    static func p_generateUUID() -> String {
        var uuidRef = CFUUIDCreate(nil)
        let uuidStringRef = CFUUIDCreateString(nil, uuidRef)
        if uuidRef != nil {
            uuidRef = nil
        }
        var uuid = ""
        if uuidStringRef != nil {
            uuid = uuidStringRef! as String
        }
        return uuid
    }
}
