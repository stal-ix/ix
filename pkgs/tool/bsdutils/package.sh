{% extends '//mix/template/meson.sh' %}

{% block fetch %}
# url https://github.com/dcantrell/bsdutils/archive/a1eeb6c8ca7745a28b68ae87b7532d8868b53515.zip
# md5 f3a640fd2b0939d0c17a2eb17801919c
{% endblock %}

{% block deps %}
# bld {{'lib/linux lib/fts lib/rpmatch' | linux}}
# bld lib/cxx lib/xo lib/edit lib/openssl lib/curses/any
# bld dev/build/meson dev/build/pkg-config dev/lang/flex dev/lang/byacc env/std
{% endblock %}
