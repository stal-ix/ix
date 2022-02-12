{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus/dbus-1.12.20.tar.gz
sha:f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_tool %}
bin/auto/conf/archive
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -rf etc var share/dbus-1
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): fixme'
{% endblock %}
