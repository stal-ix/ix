#pragma once

#if defined(__cplusplus)
extern "C" {
#endif

const char* ix_temp_dir();
char* ix_mkstemp_template();
int ix_mkstemp();

#if defined(__cplusplus)
}
#endif
