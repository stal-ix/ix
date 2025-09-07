{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libX11-locale
{% endblock %}

{% block version %}
1.8.12
{% endblock %}

{% block fetch %}
https://www.x.org/releases/individual/lib/libX11-{{self.version().strip()}}.tar.xz
fa026f9bb0124f4d6c808f9aef4057aad65e7b35d8ff43951cef0abe06bb9a9a
{% endblock %}

{% block bld_libs %}
lib/c
aux/x11/proto
{% endblock %}

{% block setup_target_flags %}
export X11_CFLAGS="-DXXX"
export X11_LIBS="-LXXX"
{% endblock %}

{% block build %}
cd nls
{{super()}}
{% endblock %}

{% block install %}
cd nls
{{super()}}
{% endblock %}

{% block env %}
export X11_LOCALE_DIR=${out}/share/X11/locale
{% endblock %}
