{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/jstedfast/gmime/archive/refs/tags/3.2.12.tar.gz
sha:c7419ce0e356e8e94d0b21f611a603e19def15f8d1fd56ebb03c03650e0067d6
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/glib
lib/idn/2
{% endblock %}

{% block bld_tool %}
bin/gtk/doc
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
--enable-introspection=no
--enable-vala=no
{% endblock %}
