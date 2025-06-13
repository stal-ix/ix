{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
procps
{% endblock %}

{% block version %}
4.0.5
{% endblock %}

{% block fetch %}
https://gitlab.com/procps-ng/procps/-/archive/v{{self.version().strip()}}/procps-v{{self.version().strip()}}.tar.bz2
7e4b385e8f3e426089f3bb04e3bf150c710b875bd005474f034486b2379ce221
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

{% block setup_target_flags %}
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
