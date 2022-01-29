{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
http://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.6.tar.bz2
fc109b2fa4517caeae1697d936ca78ff
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block bld_libs %}
lib/c
lib/udev
lib/intl
lib/curses
lib/alsa/lib
{% endblock %}

{% block configure_flags %}
--with-udev-rules-dir="${out}/share"
--with-curses=ncurses
{% endblock %}
