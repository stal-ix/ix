{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/procps-ng/procps/-/archive/v4.0.3/procps-v4.0.3.tar.bz2
sha:56db2ed0f3733e2d4e5656dec4bd8852e05b925c10aacc8f87b763d4916dd0c9
{% endblock %}

{% block lib_deps %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block setup %}
export ac_cv_lib_error_at_line=no
export ac_cv_header_error_h=no
{% endblock %}

{% block configure_flags %}
--disable-w-from
--disable-kill
--disable-rpath
--with-ncurses
--disable-modern-top
{% endblock %}

{% block patch %}
sed -e 's|utmpx.h|utmp.h|' -i src/w.c
{% endblock %}
