{% extends '//die/c/make.sh' %}

{% block pkg_name %}
runit
{% endblock %}

{% block version %}
2.3.1
{% endblock %}

{% block fetch %}
https://smarden.org/runit/runit-{{self.version().strip()}}.tar.gz
634f23c8c4d1d440043be0fe928ddf904626289e97bfe7c5826e93aaf2cc6fe9
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cpp_missing %}
unistd.h
{% endblock %}

{% block c_flags %}
-Wno-implicit-int
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
