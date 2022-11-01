{% extends '//bin/et/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block cmake_flags %}
{{super()}}
DISABLE_SENTRY=ON
DISABLE_TELEMETRY=ON
DISABLE_CRASH_LOG=ON
{% endblock %}

{% block patch %}
{{super()}}

sed -e 's|GetTempDirectory|GetTempDirectory_xxx|' -i src/base/Headers.hpp

cat << EOF >> src/base/Headers.hpp
#pragma once

#include <ix.h>

inline string GetTempDirectory() {
    return  ix_temp_dir();
}
EOF
{% endblock %}
