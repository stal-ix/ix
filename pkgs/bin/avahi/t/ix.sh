{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/avahi/avahi/releases/download/v0.8/avahi-0.8.tar.gz
sha:060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda
{% endblock %}

{% block bld_libs %}
lib/c
lib/dbus
lib/glib
lib/expat
lib/daemon
lib/kernel
{% endblock %}

{% block configure_flags %}
--disable-python
--disable-pygobject
--disable-python-dbus
--disable-mono
--disable-monodoc
--with-xml=expat
--with-distro=none
--disable-libevent
--disable-qt4
--disable-qt5
--disable-gtk
--disable-gtk3
--disable-gdbm
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|check_inconsistencies=yes|check_inconsistencies=no|' -i configure
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|install-data-local:|install-data-local-xxx:|' -i avahi-daemon/Makefile
cat << EOF >> avahi-daemon/Makefile
install-data-local:
EOF
{% endblock %}

{% block make_flags %}
avahi_runtime_dir="/var/run/avahi"
avahi_socket="/var/run/avahi/socket"
{% endblock %}
