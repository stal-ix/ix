{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/managarm/mlibc/archive/refs/tags/3.0.0-rc2.tar.gz
sha:9d9acd6f87bf7ef3d7418e4a3fedeed616a8bb287e48d37e6e773e7cf3c17255
{% endblock %}

{% block bld_libs %}
lib/mlibc/frigg
lib/mlibc/cxxshim
{% endblock %}

{% block patch %}
sed -e 's|.*include_dir.*ccdir.*||' -i meson.build
cat - options/ansi/include/limits.h << EOF > _
#include_next <limits.h>
EOF
mv _ options/ansi/include/limits.h
{% endblock %}
