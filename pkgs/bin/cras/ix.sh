{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://chromium.googlesource.com/chromiumos/third_party/adhd/+archive/master/cras.tar.gz
sha:2514f7907b9d5121c9a340d16e7522aa6a41352d9bee914d8358f7972c1331d7
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract 0 ${src}/*
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/sbc
lib/alsa
lib/dbus
lib/udev
lib/linux
lib/curses
lib/sndfile
lib/gnushim
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
