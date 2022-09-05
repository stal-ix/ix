{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.jedsoft.org/releases/slang/slang-2.3.3.tar.bz2
sha:f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c4a0617743c8f5a18
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
