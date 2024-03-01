{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/chromiumos/third_party/adhd
{% endblock %}

{% block git_commit %}
d4de233e76946e91fab6c879717d53da62d94f57
{% endblock %}

{% block git_sha %}
ea5e22ba1214228f3cbdf5d10441ae9019ea316dcc70f581bc120f315d6051a9
{% endblock %}

{% block git_refine %}
find . -type l -delete
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
# ieee754.h
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

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_tool %}
bin/xxd
bld/fakegit
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
