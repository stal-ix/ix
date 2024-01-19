{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/procps-ng/procps/-/archive/v4.0.4/procps-v4.0.4.tar.bz2
sha:08dbaaaae6afe8d5fbeee8aa3f8b460b01c5e09ce4706b161846f067103a2cf2
{% endblock %}

{% block lib_deps %}
lib/c
lib/intl
lib/numa
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
rm library/include/numa.h
>library/numa.c
find . -type f -name '*.c' | while read l; do
    sed -e 's|numa_init();||g' -e 's|numa_uninit();||g' -i ${l}
done
{% endblock %}
