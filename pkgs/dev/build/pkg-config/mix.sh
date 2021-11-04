{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
f6e931e319531b736fadc017f470e68a
{% endblock %}

{% block bld_deps %}
env/std/mix.sh
lib/intl/mix.sh
lib/glib/mix.sh
lib/iconv/mix.sh
boot/final/env/tools/mix.sh
{% endblock %}

{% block coflags %}
--disable-host-tool
{% block pkgflags %}
{% endblock %}
{% endblock %}

{% block env %}
export PKG_CONFIG="${out}/bin/pkg-config"
{% endblock %}
