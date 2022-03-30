#pragma once

#define error_message_count mix_error_message_count
extern unsigned int error_message_count;

#define error mix_error
void error(int status, int errnum, const char* format, ...);
