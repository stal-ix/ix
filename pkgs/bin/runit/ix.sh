{% extends '//die/c/make.sh' %}

{% block fetch %}
http://smarden.org/runit/runit-2.1.2.tar.gz
sha:6fd0160cb0cf1207de4e66754b6d39750cff14bb0aa66ab49490992c0c47ba18
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cpp_missing %}
unistd.h
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-implicit-int ${CFLAGS}"
{% endblock %}

{% block unpack %}
{{super()}}
cd runit*
{% endblock %}

{% block build %}
cd src
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin

cat package/commands | while read i; do
    cp src/${i} ${out}/bin/
done
{% endblock %}
