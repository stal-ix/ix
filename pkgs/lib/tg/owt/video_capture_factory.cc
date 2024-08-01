#include "modules/video_capture/video_capture_factory.h"

namespace webrtc {

rtc::scoped_refptr<VideoCaptureModule> VideoCaptureFactory::Create(const char* deviceUniqueIdUTF8) {
  return nullptr;
}

rtc::scoped_refptr<VideoCaptureModule> VideoCaptureFactory::Create(VideoCaptureOptions* options, const char* deviceUniqueIdUTF8) {
  return nullptr;
}

VideoCaptureModule::DeviceInfo* VideoCaptureFactory::CreateDeviceInfo() {
  return nullptr;
}

VideoCaptureModule::DeviceInfo* VideoCaptureFactory::CreateDeviceInfo(VideoCaptureOptions* options) {
  return nullptr;
}

}  // namespace webrtc
