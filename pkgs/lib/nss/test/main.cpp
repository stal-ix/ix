#include <nss.h>
#include <pk11pub.h>
#include <plarena.h>
#include <prerror.h>
#include <prinit.h>
#include <prtime.h>
#include <secmod.h>
#include <iostream>

int main() {
    PR_Init(PR_USER_THREAD, PR_PRIORITY_NORMAL, 0);
    std::cerr << PR_GetError() << std::endl;
    std::cerr << PR_GetOSError() << std::endl;
    std::cerr << (int)NSS_NoDB_Init(nullptr) << std::endl;
    std::cerr << PR_GetError() << std::endl;
    std::cerr << PR_GetOSError() << std::endl;
    std::cerr << SECSuccess << std::endl;
}
