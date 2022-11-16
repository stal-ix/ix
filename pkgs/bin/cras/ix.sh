{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://chromium.googlesource.com/chromiumos/third_party/adhd/+archive/master/cras.tar.gz
sha:2514f7907b9d5121c9a340d16e7522aa6a41352d9bee914d8358f7972c1331d7
https://chromium.googlesource.com/chromiumos/third_party/adhd/+/454c81a0669c2c5ffc7132d870b7421291b6630e/cras/src/server/rate_estimator.c?format=TEXT
sha:6df4671824a77a1fec196bd0f6e353358779c1773fbff9fd3283a05c382fd04a
https://chromium.googlesource.com/chromiumos/third_party/adhd/+/454c81a0669c2c5ffc7132d870b7421291b6630e/cras/src/server/rate_estimator.h?format=TEXT
sha:295cd44d40e5c487f86b1935835446e562652bc8eccbade67e598135247573ed
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block unpack %}
{{super()}}
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

{% block setup_tools %}
cat << EOF > rustc
#!/bin/sh
EOF

cat << EOF > cargo
#!/bin/sh
EOF

chmod +x *
{% endblock %}

{% block setup %}
export CFLAGS="-include sys/types.h ${CFLAGS}"
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
