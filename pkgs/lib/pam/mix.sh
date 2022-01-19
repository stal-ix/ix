{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v1.5.2.tar.gz
8ee1a30bf17b4992ae697bf6c9a4cb0c
{% endblock %}

{% block bld_tool %}
bin/gettext
dev/lang/flex
dev/lang/byacc
dev/build/auto/make/1/16
dev/build/auto/conf/2/69
{% endblock %}

{% block autoreconf %}
sh autogen.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block configure_flags %}
--disable-doc
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
ln -s ../include security
{% endblock %}
