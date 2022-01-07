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
lib/readline
lib/curses
lib/oniguruma
{% endblock %}

{% block run_data %}
lib/curses/n/terminfo
{% endblock %}

{% block setup_tools %}
cat << EOF > ncurses5-config
#!$(which sh)
echo ${TERMINFO}
EOF

chmod +x ncurses5-config
{% endblock %}

{% block configure_flags %}
--with-readline=gnu
--without-png
{% endblock %}

{% block build %}
make install-static
{% endblock %}

{% block install %}
echo 'already installed, fixme'
{% endblock %}

{% block env %}
export COFLAGS="--with-slang=${out} \${COFLAGS}"
{% endblock %}
