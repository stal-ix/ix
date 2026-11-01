{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
weechat
{% endblock %}

{% block version %}
4.10.2
{% endblock %}

{% block fetch %}
https://github.com/weechat/weechat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bdb0dfdfb1123d09223fb8a0dbb3689f6afaa6c483560a1225c4e576252cee02
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
