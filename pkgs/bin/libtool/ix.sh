{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
addf44b646ddb4e3919805aa88fa7c5e
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

find . -type f | while read l; do
    sed -e 's|/.*/store/.*/bin/||g' -i ${l}
done

cd bin

ln -s libtoolize glibtoolize
ln -s libtool glibtool
{% endblock %}

{% block env %}
export LIBTOOLIZE=libtoolize
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
