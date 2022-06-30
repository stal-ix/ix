{% extends '//bin/bash/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-3.2.57.tar.gz
md5:237a8767c990b43ae2c89895c2dbc062
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
lib/readline
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/byacc
bld/texinfo
{% endblock %}

{% block patch %}
cat << EOF > support/config.sub
#!$(which sh)
echo {{target.gnu.three}}
EOF
chmod +x support/config.sub
rm y.tab* lib/intl/plural.c
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}

{% block install %}
{{super()}}
cd ${out}; mv info share/
{% endblock %}
