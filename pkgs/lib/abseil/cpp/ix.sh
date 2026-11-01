{% extends '//die/c/cmake.sh' %}

# noauto

# check bin/telegram/desktop

{% block pkg_name %}
abseil-cpp
{% endblock %}

{% block version %}
20260817.0
{% endblock %}

{% block fetch %}
https://github.com/abseil/abseil-cpp/archive/refs/tags/{{self.version().strip()}}.tar.gz
f7e05179df39c45434cad433f5783840bb3788ef322976f9138bc6b72b3a107d
{% endblock %}

{% block lib_deps %}
lib/c/naked
lib/c++/dispatch
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% if mingw32 %}
lib/shim/dll(dll_name=advapi32)
lib/shim/dll(dll_name=dbghelp)
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
cat << EOF > absl/base/options.h
{% include 'options.h' %}
EOF
sed -e 's|APPLE AND CMAKE|APPLE_XXX AND CMAKE|' \
    -i absl/copts/AbseilConfigureCopts.cmake
# MinGW does not provide O_NONBLOCK. Match upstream's fallback for platforms
# where the flag is unavailable; regular files are unaffected by its absence.
sed -e '/#ifndef O_CLOEXEC/i\
#ifndef O_NONBLOCK\
#define O_NONBLOCK 0\
#endif' \
    -i absl/time/internal/cctz/src/time_zone_info.cc
# The absl::Nonnull/Nullable/NullabilityUnknown alias templates were dropped
# for the absl_nonnull macros; webrtc (lib/tg/owt) and whatever includes its
# headers still spell them the old way. Same meaning, minus the annotation.
cat << EOF >> absl/base/nullability.h

#if defined(__cplusplus) && !defined(ABSL_IX_NULLABILITY_ALIASES)
#define ABSL_IX_NULLABILITY_ALIASES
namespace absl {
ABSL_NAMESPACE_BEGIN
template <typename T> using Nonnull = T;
template <typename T> using Nullable = T;
template <typename T> using NullabilityUnknown = T;
ABSL_NAMESPACE_END
}  // namespace absl
#endif
EOF
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
CMAKE_CXX_STANDARD=20
# we propagate it ourselves
ABSL_PROPAGATE_CXX_STD=OFF
{% endblock %}
