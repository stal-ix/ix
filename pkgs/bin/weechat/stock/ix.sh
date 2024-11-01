{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/weechat/weechat/archive/refs/tags/v4.4.3.tar.gz
sha:c59b04405584fb76adb04c731b0dcde0c1add371cd050c83e7360b9f220cea72
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/intl
lib/curl
lib/gcrypt
lib/gnutls
lib/c/json
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
