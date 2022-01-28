{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://launchpad.net/libappindicator/12.10/12.10.0/+download/libappindicator-12.10.0.tar.gz
sha:d5907c1f98084acf28fd19593cb70672caa0ca1cf82d747ba6f4830d4cc3b49f
{% endblock %}

{% block step_unpack1 %}
cd /home/mix/sources/kIYJET18AWKVfP8P/src
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/indicator
lib/dbus/menu
lib/dbus/glib
{% endblock %}

{% block configure_flags %}
--with-gtk=3
--disable-tests
--disable-introspection
--enable-introspection=no
{% endblock %}

{% block bld_tool %}
lib/glib
bld/python
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include '00.diff/base64' %}
EOF
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
