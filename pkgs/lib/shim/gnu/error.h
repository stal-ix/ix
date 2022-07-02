#pragma once

#if defined(__cplusplus)
extern "C" {
#endif

#define error_message_count ix_error_message_count
extern unsigned int error_message_count;

#define error ix_error
void error(int status, int errnum, const char* format, ...);

#define error_at_line ix_error_at_line
void error_at_line(int status, int errnum, const char* filename, unsigned int linenum, const char* format, ...);

#if defined(__cplusplus)
}
#endif
