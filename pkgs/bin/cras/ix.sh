{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/chromiumos/third_party/adhd
{% endblock %}

{% block git_commit %}
d4de233e76946e91fab6c879717d53da62d94f57
{% endblock %}

{% block git_sha %}
2cdbc6e56834d2f58b27e05468fbef4439de6e9156a1aab1f0e494c45a12e9e0
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/sbc
lib/alsa
lib/dbus
lib/udev
lib/kernel
lib/curses
lib/sndfile
lib/shim/gnu
lib/ini/parser
lib/ladspa/sdk
lib/google/test
lib/bsd/overlay
lib/xiph/speex/dsp
{% endblock %}

{% block configure_flags %}
--disable-alsa-plugin
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bin/vim
bin/bash/lite/sh
bld/fake(tool_name=rustc)
bld/fake(tool_name=cargo)
{% endblock %}

{% block cpp_missing %}
sys/types.h
{% endblock %}

{% block configure %}
{{super()}}
find . -type f -name Makefile | while read l; do
    sed -e 's|\$.*libcras_rust.a||' -i ${l}
done
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cras
{% endblock %}

{% block patch %}
base64 -d << EOF > src/server/rate_estimator.h
{% include 'rate_estimator.h/base64' %}
EOF
base64 -d << EOF > src/server/rate_estimator.c
{% include 'rate_estimator.c/base64' %}
EOF
cat src/server/rate_estimator.c >> src/server/linear_resampler.c
{% endblock %}
