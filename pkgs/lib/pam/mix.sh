{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v1.5.2.tar.gz
8ee1a30bf17b4992ae697bf6c9a4cb0c
{% endblock %}

{% block bld_tool %}
bin/flex
bin/byacc
bin/gettext
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
