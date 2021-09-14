{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
# md5 f6e931e319531b736fadc017f470e68a
{% endblock %}

{% block deps %}
# bld env/std
# bld lib/intl
# bld lib/glib
# bld lib/iconv
# bld boot/final/env/tools
{% endblock %}

{% block coflags %}
--disable-host-tool
{% block pkgflags %}
{% endblock %}
{% endblock %}

{% block env %}
export PKG_CONFIG="${out}/bin/pkg-config"
{% endblock %}
