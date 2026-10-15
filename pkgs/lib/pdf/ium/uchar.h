// The seven ICU character functions PDFium's core calls (fx_extension.h,
// with USE_SYSTEM_ICUUC), over the libc's wide-character tables instead of
// ICU: musl's and wasi-libc's follow Unicode's categories and case mappings.
#ifndef UNICODE_UCHAR_H_
#define UNICODE_UCHAR_H_

#include <stdint.h>
#include <wctype.h>

typedef int32_t UChar32;
typedef int8_t UBool;

static inline UBool u_isalpha(UChar32 c) { return iswalpha((wint_t)c) != 0; }
static inline UBool u_isalnum(UChar32 c) { return iswalnum((wint_t)c) != 0; }
static inline UBool u_isspace(UChar32 c) { return iswspace((wint_t)c) != 0; }
static inline UBool u_isupper(UChar32 c) { return iswupper((wint_t)c) != 0; }
static inline UBool u_islower(UChar32 c) { return iswlower((wint_t)c) != 0; }
static inline UChar32 u_tolower(UChar32 c) { return (UChar32)towlower((wint_t)c); }
static inline UChar32 u_toupper(UChar32 c) { return (UChar32)towupper((wint_t)c); }

#endif
