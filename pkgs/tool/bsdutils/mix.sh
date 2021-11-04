{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/dcantrell/bsdutils/archive/a1eeb6c8ca7745a28b68ae87b7532d8868b53515.zip
f3a640fd2b0939d0c17a2eb17801919c
{% endblock %}

{% block bld_deps %}
{% if mix.platform.target.os == 'linux' %}
lib/linux/mix.sh
lib/fts/mix.sh
lib/rpmatch/mix.sh
{% endif %}
lib/cxx/mix.sh
lib/xo/mix.sh
lib/edit/mix.sh
lib/openssl/mix.sh
lib/curses/any/mix.sh
dev/build/meson/mix.sh
dev/build/pkg-config/mix.sh
dev/lang/flex/mix.sh
dev/lang/byacc/mix.sh
env/std/mix.sh
{% endblock %}
