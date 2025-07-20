{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
weechat
{% endblock %}

{% block version %}
4.7.0
{% endblock %}

{% block fetch %}
https://github.com/weechat/weechat/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c2298fc01eb7d88cf6c89936f9b994ec58c4f9e79c05a7fb00e8e22d8a57cd0b
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
