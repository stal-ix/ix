{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.x.org/releases/individual/lib/libX11-1.8.6.tar.xz
sha:59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9
{% endblock %}

{% block bld_libs %}
lib/c
aux/x11/proto
{% endblock %}

{% block setup %}
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
