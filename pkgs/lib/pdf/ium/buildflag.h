// Chromium's build/buildflag.h, the one macro PDFium reads flags through:
// BUILDFLAG(X) expands to the call BUILDFLAG_INTERNAL_X(), which
// build/build_config.h defines as (0) or (1).
#ifndef BUILD_BUILDFLAG_H_
#define BUILD_BUILDFLAG_H_

#define BUILDFLAG_CAT_INDIRECT(a, b) a##b
#define BUILDFLAG_CAT(a, b) BUILDFLAG_CAT_INDIRECT(a, b)
#define BUILDFLAG(flag) (BUILDFLAG_CAT(BUILDFLAG_INTERNAL_, flag)())

#endif
