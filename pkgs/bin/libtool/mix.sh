{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
addf44b646ddb4e3919805aa88fa7c5e
{% endblock %}

{% block bld_tool %}
bin/m4
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin

ln -s libtoolize glibtoolize
ln -s libtool glibtool
{% endblock %}

{% block env %}
export LIBTOOLIZE=libtoolize
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
