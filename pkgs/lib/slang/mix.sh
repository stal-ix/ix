{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://storage.yandexcloud.net/mix-cache/slang-2.3.2.tar.bz2
# md5 c2d5a7aa0246627da490be4e399c87cb
{% endblock %}

{% block deps %}
# lib lib/z/mix.sh
# lib lib/pcre/mix.sh
# lib lib/iconv/mix.sh
# lib lib/readline/mix.sh
# lib lib/curses/any/mix.sh
# lib lib/curses/terminfo/mix.sh
# lib lib/oniguruma/mix.sh
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block toolconf %}
cat << EOF > ncurses5-config
#!$(command -v dash)
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
