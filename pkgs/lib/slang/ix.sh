{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.jedsoft.org/releases/slang/slang-2.3.2.tar.bz2
sha:fc9e3b0fc4f67c3c1f6d43c90c16a5c42d117b8e28457c5b46831b8b5d3ae31a
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/pcre
lib/iconv
lib/oniguruma
{% endblock %}

{% block bld_tool %}
aux/terminfo/config
{% endblock %}

{% block run_data %}
aux/terminfo
{% endblock %}

{% block configure_flags %}
--without-png
{% endblock %}

{% block make_target %}
static
{% endblock %}

{% block make_install_target %}
install-static
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-slang=${out} \${COFLAGS}"
{% endblock %}
