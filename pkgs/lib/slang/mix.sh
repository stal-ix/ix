{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://storage.yandexcloud.net/mix-cache/slang-2.3.2.tar.bz2
c2d5a7aa0246627da490be4e399c87cb
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/z/mix.sh
lib/pcre/mix.sh
lib/iconv/mix.sh
lib/readline/mix.sh
lib/curses/mix.sh
lib/oniguruma/mix.sh
{% endblock %}

{% block run_data %}
lib/curses/n/mix.sh
{% endblock %}

{% block setup_tools %}
cat << EOF > ncurses5-config
#!$(which dash)
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
