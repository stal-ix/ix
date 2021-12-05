{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://storage.yandexcloud.net/mix-cache/slang-2.3.2.tar.bz2
c2d5a7aa0246627da490be4e399c87cb
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/pcre/mix.sh
lib/iconv/mix.sh
lib/readline/mix.sh
lib/curses/mix.sh
lib/curses/terminfo/mix.sh
lib/oniguruma/mix.sh
{% endblock %}

{% block toolconf %}
cat << EOF > ncurses5-config
#!$(which dash)
echo ${TERMINFO}
EOF

chmod +x ncurses5-config
{% endblock %}

{% block coflags %}
--with-readline=gnu
--without-png
{% endblock %}

{% block build %}
make install-static
{% endblock %}

{% block install %}
{% endblock %}

{% block env %}
export COFLAGS="--with-slang=${out} \${COFLAGS}"
{% endblock %}
