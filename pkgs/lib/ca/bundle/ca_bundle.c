#include "ca_bundle.h"

#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <unistd.h>

// possible certificate files; stop after finding one.
// stolen from go sources
static const char* knownLocations[] = {
    "/etc/ssl/certs/ca-certificates.crt",                // Debian/Ubuntu/Gentoo etc.
    "/etc/pki/tls/certs/ca-bundle.crt",                  // Fedora/RHEL 6
    "/etc/ssl/ca-bundle.pem",                            // OpenSUSE
    "/etc/pki/tls/cacert.pem",                           // OpenELEC
    "/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem", // CentOS/RHEL 7
    "/etc/ssl/cert.pem",                                 // Alpine Linux
};

const char* ix_ca_bundle() {
    struct stat buf;

    for (size_t i = 0; i < sizeof(knownLocations) / sizeof(*knownLocations); ++i) {
        if (stat(knownLocations[i], &buf) == 0) {
            return knownLocations[i];
        }
    }

    // need return something
    return knownLocations[0];
}
