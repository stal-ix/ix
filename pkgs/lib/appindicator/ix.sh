{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://launchpad.net/libappindicator/12.10/12.10.0/+download/libappindicator-12.10.0.tar.gz
sha:d5907c1f98084acf28fd19593cb70672caa0ca1cf82d747ba6f4830d4cc3b49f
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
bld/python
bld/glib
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
rm autogen.sh

(base64 -d | patch -p1) << EOF
{% include '0.diff/base64' %}
EOF
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
