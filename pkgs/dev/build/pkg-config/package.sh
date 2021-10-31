{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
# md5 f6e931e319531b736fadc017f470e68a
{% endblock %}

{% block deps %}
# bld env/std/package.sh
# bld lib/intl/package.sh
# bld lib/glib/package.sh
# bld lib/iconv/package.sh
# bld boot/final/env/tools/package.sh
{% endblock %}

{% block coflags %}
--disable-host-tool
{% block pkgflags %}
{% endblock %}
{% endblock %}

{% block env %}
export PKG_CONFIG="${out}/bin/pkg-config"
{% endblock %}
