{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/OpenPrinting/cups/archive/refs/tags/v2.4.8.tar.gz
sha:4cca3693f076542006c663a8debc883ddac3050da3d4a4a43e760efcb12cd4b3
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/usb
lib/dbus
lib/kernel
lib/openssl
{% endblock %}

{% block configure_flags %}
--with-icondir=${out}/share/icons
--with-menudir=${out}/share/xdg
{% endblock %}
