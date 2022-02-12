{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/procps-ng/procps/-/archive/v3.3.17/procps-v3.3.17.tar.bz2
sha:8374d281f91e5fc9bb9ea8dc991b25331e3a2b0299b46f22c633f7fb6bcb0764
https://git.alpinelinux.org/aports/plain/main/procps/musl-fixes.patch
sha:81c41af2a9bb6118e3a74b6b6d0e8edd7d323f8cdd87cf36c074de4201c3e854
{% endblock %}

{% block lib_deps %}
lib/c
lib/intl
lib/curses
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block setup %}
export ac_cv_lib_error_at_line=no
export ac_cv_header_error_h=no
{% endblock %}

{% block patch %}
cat ${src}/*.patch | patch -p1
{% endblock %}

{% block configure_flags %}
--enable-watch8bit
--enable-sigwinch
--enable-wide-percent
--enable-wide-memory
{% endblock %}
