{% extends '//bin/et/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{#
/home/ci/ix_root/store/efd9flwKQN8JjFk1-lib-abseil-cpp/include/absl/container/internal/btree.h:103:64: error: no member named 'weak_ordering' in namespace 'absl'
  103 |     std::is_convertible<compare_result_t<Compare, T, T>, absl::weak_ordering>;
/home/ci/ix_root/store/efd9flwKQN8JjFk1-lib-abseil-cpp/include/absl/container/internal/btree.h:119:9: error: no type named 'weak_ordering' in namespace 'absl'
  119 |   absl::weak_ordering operator()(absl::string_view lhs,
/home/ci/ix_root/store/efd9flwKQN8JjFk1-lib-abseil-cpp/include/absl/container/internal/btree.h:124:9: error: no type named 'weak_ordering' in namespace 'absl'
  124 |   absl::weak_ordering operator()(const absl::Cord &lhs)
#}

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
    return ix_temp_dir();
}
EOF
{% endblock %}
