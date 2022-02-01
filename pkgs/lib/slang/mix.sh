{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://storage.yandexcloud.net/mix-cache/slang-2.3.2.tar.bz2
c2d5a7aa0246627da490be4e399c87cb
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/pcre
lib/iconv
lib/curses
lib/oniguruma
{% endblock %}

{% block bld_libs %}
lib/readline
{% endblock %}

{% block bld_tool %}
lib/curses/n/terminfo/config
{% endblock %}

{% block run_data %}
lib/curses/n/terminfo
{% endblock %}

{% block configure_flags %}
--with-readline=gnu
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
