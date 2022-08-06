#include "stdlib.h"

char* canonicalize_file_name(const char* path) {
    return realpath(path, NULL);
}
