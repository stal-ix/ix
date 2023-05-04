{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.9.tar.bz2
sha:e7623d4525595f92e11ce25ee9a97f2040a14c6e4dcd027aa96e06cbce7817bd
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block bld_libs %}
lib/c
lib/alsa
lib/udev
lib/intl
lib/curses
lib/samplerate
{% endblock %}

{% block configure_flags %}
--with-udev-rules-dir="${out}/share"
--with-curses=ncurses
{% endblock %}

{% block patch %}
sed -e 's|install-data-hook|xxx|' -i Makefile.am
{% endblock %}
