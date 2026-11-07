{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
weechat
{% endblock %}

{% block version %}
4.10.3
{% endblock %}

{% block fetch %}
https://github.com/weechat/weechat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
eb54a9da5b061b3248ccf9335f6986e8b9919d8f33d4457f7b811785a0ccd3f8
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
