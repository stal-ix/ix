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

{% block install %}
mkdir ${out}/lib
cp gllib/libgnu.a ${out}/lib
find gllib -name '*.c' -delete
find gllib -name '*.o' -delete
find gllib -name '*.gperf' -delete
find gllib -name 'Makefile*' -delete
cp -R gllib ${out}/include
cp config.h ${out}/include/gnulib_config.h
{% endblock %}

{% block env %}
export CPPFLAGS="-include ${out}/include/gnulib_config.h \${CPPFLAGS}"
{% endblock %}
