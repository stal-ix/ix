{% extends '//die/c/autorehell.sh' %}

{% block bld_data %}
lib/gnu/src
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd posixlib
{% endblock %}

{% block autoreconf %}
aclocal -I glm4
autoconf
autoheader
automake --add-missing --copy
{% endblock %}

{% block bld_tool %}
bin/gperf
{% endblock %}

{% block patch %}
sed -e 's|.*NMD.*||' -i gllib/Makefile.am
cat << EOF > gltests/Makefile.am
all:
install:
EOF
cat << EOF > gltests/Makefile.in
all:
install:
EOF
{% endblock %}
