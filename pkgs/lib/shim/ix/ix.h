#pragma once

#if defined(__cplusplus)
extern "C" {
#endif

const char* ix_temp_dir();
const char* ix_temp_session_dir();
const char* ix_uniq_socket();

#if defined(__cplusplus)
}
#endif
