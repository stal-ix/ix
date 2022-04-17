#include "config.h"
#include "InjectedBundle.h"
#include "WKBundleAPICast.h"
#include "WKBundleInitialize.h"
#include "WebKitExtensionManager.h"

#include <wtf/FileSystem.h>
#include <wtf/text/CString.h>

#include <WebKit/WKBundleAPICast.h>
#include <WebKit/WKBundleInitialize.h>

using namespace WebKit;

static void WKBundleInitialize(WKBundleRef bundle, WKTypeRef userData) {
    WebKitExtensionManager::singleton().initialize(toImpl(bundle), toImpl(userData));
}

namespace WebKit {

bool InjectedBundle::initialize(const WebProcessCreationParameters&, API::Object* initializationUserData) {
    WKBundleInitialize(toAPI(this), toAPI(initializationUserData));
    return true;
}

void InjectedBundle::setBundleParameter(WTF::String const&, IPC::DataReference const&) {
}

void InjectedBundle::setBundleParameters(const IPC::DataReference&) {
}

} // namespace WebKit
