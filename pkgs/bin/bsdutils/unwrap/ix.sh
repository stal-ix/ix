{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/dcantrell/bsdutils/archive/refs/tags/v13.1.tar.gz
sha:0c601613cbdfc224d280ef1980d6ec89911aba9679fff7b2249e9eb4439ca499
{% endblock %}

{% block bld_libs %}
lib/c
lib/xo
lib/c++
lib/edit
lib/curses
lib/openssl
lib/shim/fake(lib_name=tinfo)

{% if linux %}
lib/fts
lib/kernel
lib/rpmatch
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/flex
bld/byacc
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin/* bin/
rm -r sbin
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
# TODO(pg): fix fts/rpmatch lookup
sed -e 's|, static.*||' -i meson.build
{% endblock %}
