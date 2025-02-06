#include <nss.h>
#include <pk11pub.h>
#include <plarena.h>
#include <prerror.h>
#include <prinit.h>
#include <prtime.h>
#include <secmod.h>

int main() {
    PR_Init(PR_USER_THREAD, PR_PRIORITY_NORMAL, 0);
    NSS_NoDB_Init(nullptr);
}
