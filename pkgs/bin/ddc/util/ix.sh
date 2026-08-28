{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ddcutil
{% endblock %}

{% block version %}
2.2.7
{% endblock %}

{% block fetch %}
https://github.com/rockowitz/ddcutil/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7b5cb9824c23974241146f4a696abc65f8e9d1e950198c8dc00e4a5c6a2f41ee
{% endblock %}

{% block bld_libs %}
lib/c
lib/acl
lib/usb
lib/drm
lib/glib
lib/kernel
lib/jansson
{% endblock %}

{% block patch %}
sed -e 's|AC_USE_SYSTEM_EXTENSIONS|IX_USE_SYSTEM_EXTENSIONS|' \
    -e 's|AC_CONFIG_AUX_DIR(config)|AC_USE_SYSTEM_EXTENSIONS|' \
    -e 's|IX_USE_SYSTEM_EXTENSIONS|AC_CONFIG_AUX_DIR(config)|' \
    -e 's|AC_REQUIRE(AC_PROG_CC)|AC_PROG_CC|' \
    -i configure.ac

sed -e '/#include <execinfo.h>/i #ifdef HAVE_EXECINFO_H' \
    -e '/#include <execinfo.h>/a #endif' \
    -e 's|#ifdef BACKTRACE|#if defined(BACKTRACE) \&\& defined(HAVE_EXECINFO_H)|' \
    -i src/util/linux_util.c

sed -e '/dref->flags |= DREF_DPMS_SUSPEND_STANDBY_OFF;/d' \
    -i src/ddc/ddc_displays.c
{% endblock %}

{% block configure_flags %}
--disable-x11
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
