{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ddcutil
{% endblock %}

{% block version %}
3.0.2
{% endblock %}

{% block fetch %}
https://github.com/rockowitz/ddcutil/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d6b2a42378233aaff6188a0a5ff9fa0e959cb95742367e2cdfa2c6a023c7fe26
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
