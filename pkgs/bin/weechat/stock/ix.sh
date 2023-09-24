{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/weechat/weechat/archive/refs/tags/v4.0.5.tar.gz
sha:4564caf767ccac6c9ed51ac12bade83bd040f42931dd76a81f82a9e3ba0ee57c
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/intl
lib/curl
lib/gcrypt
lib/gnutls
lib/enchant
lib/shim/fake/pkg(pkg_name=lua,pkg_ver=5.4)
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block cmake_flags %}
ENABLE_NLS=OFF
ENABLE_PERL=OFF
ENABLE_PYTHON=OFF
ENABLE_RUBY=OFF
ENABLE_TCL=OFF
ENABLE_GUILE=OFF
ENABLE_PHP=OFF
ENABLE_ENCHANT=ON
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
