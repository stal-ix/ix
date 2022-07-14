{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/subversion/subversion-1.14.2.tar.bz2
sha:c9130e8d0b75728a66f0e7038fc77052e671830d785b5616aad53b4810d3cc28
{% endblock %}

{% block bld_libs %}
lib/z
lib/lz4
lib/apr
lib/intl
lib/serf
lib/neon
lib/expat
lib/sqlite3
lib/apr/util
lib/utf8/proc
{% endblock %}

{% block bld_tool %}
bld/python/2
{% endblock %}

{% block setup %}
expat="$(find_pkg expat)"

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
