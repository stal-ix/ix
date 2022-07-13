{% extends '//die/autohell.sh' %}

{# hard X11 dep #}

{% block fetch %}
https://www.claws-mail.org/download.php?file=releases/claws-mail-4.1.0.tar.xz
sha:0e1a9ca0db8d2a9e058ae30cdc7fc919779214ec3c56ee0c8a7f88cc23817a8e
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/etpan
lib/gtk/3
lib/gpgme
lib/gnutls
lib/enchant
lib/dbus/glib
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
