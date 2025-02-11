#include <nss.h>
#include <pk11pub.h>
#include <plarena.h>
#include <prerror.h>
#include <prinit.h>
#include <prtime.h>
#include <secmod.h>
#include <iostream>

SECMODModule* LoadNSSModule(const char* name, const char* library_path, const char* params) {
  std::string modparams = "name=\"" + std::string(name) + "\" library=\"" + std::string(library_path) + "\" " + std::string(params) + "";

  SECMODModule* module = SECMOD_LoadUserModule(const_cast<char*>(modparams.c_str()), nullptr, PR_FALSE);
  if (!module) {
    return nullptr;
  }
  if (!module->loaded) {
    std::cerr << "not loaded" << std::endl;
    SECMOD_DestroyModule(module);
    return nullptr;
  }
  return module;
}

int main() {
    PR_Init(PR_USER_THREAD, PR_PRIORITY_NORMAL, 0);
    std::cerr << PR_GetError() << std::endl;
    std::cerr << PR_GetOSError() << std::endl;
    std::cerr << (int)NSS_NoDB_Init(nullptr) << std::endl;
    std::cerr << PR_GetError() << std::endl;
    std::cerr << PR_GetOSError() << std::endl;
    std::cerr << SECSuccess << std::endl;
    LoadNSSModule("Root Certs", "libnssckbi.so", "");
}
