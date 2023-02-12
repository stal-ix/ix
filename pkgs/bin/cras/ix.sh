{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://chromium.googlesource.com/chromiumos/third_party/adhd/+archive/master/cras.tar.gz
sem:0ea570a68c28ae6ed1df377063d3c4bc2ae3356c5651fbcb42a5e5873b57b395
https://chromium.googlesource.com/chromiumos/third_party/adhd/+/454c81a0669c2c5ffc7132d870b7421291b6630e/cras/src/server/rate_estimator.c?format=TEXT
sha:6df4671824a77a1fec196bd0f6e353358779c1773fbff9fd3283a05c382fd04a
https://chromium.googlesource.com/chromiumos/third_party/adhd/+/454c81a0669c2c5ffc7132d870b7421291b6630e/cras/src/server/rate_estimator.h?format=TEXT
sha:295cd44d40e5c487f86b1935835446e562652bc8eccbade67e598135247573ed
{% endblock %}

{% block unpack %}
extract 0 ${src}/cras*
cat ${src}/rate_estimator.h* | base64 -d > src/server/rate_estimator.h
cat ${src}/rate_estimator.c* | base64 -d > src/server/rate_estimator.c
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
lib/googletest
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

{% block patch %}
cat src/server/rate_estimator.c >> src/server/linear_resampler.c
{% endblock %}
