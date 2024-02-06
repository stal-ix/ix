{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/subversion/subversion-1.14.3.tar.bz2
sha:949efd451a09435f7e8573574c71c7b71b194d844890fa49cd61d2262ea1a440
{% endblock %}

{% block bld_libs %}
lib/z
lib/lz4
lib/apr
lib/intl
lib/serf
lib/neon
lib/expat
lib/boost
lib/apr/util
lib/sqlite/3
lib/utf8/proc
{% endblock %}

{% block bld_tool %}
bld/python/2
{% endblock %}

{% block setup_target_flags %}
expat="$(pkg-config --variable=prefix expat)"
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v expat | tr '\n' ' ')
export COFLAGS="${COFLAGS} --with-expat=${expat}/include:${expat}/lib:-lexpat"
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block setup_tools %}
ln -s $(which python2) python
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/share/pkgconfig
{% endblock %}
