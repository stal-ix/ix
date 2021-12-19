{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/linux-pam/linux-pam/archive/refs/tags/v1.5.2.tar.gz
8ee1a30bf17b4992ae697bf6c9a4cb0c
{% endblock %}

{% block bld_tool %}
gnu/gettext/mix.sh
dev/lang/flex/mix.sh
dev/lang/byacc/mix.sh
dev/build/auto/make/1/16/mix.sh
dev/build/auto/conf/2/69/mix.sh
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_libs %}
lib/linux/mix.sh
{% endblock %}

{% block configure_flags %}
--disable-doc
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
ln -s ../include security
{% endblock %}
