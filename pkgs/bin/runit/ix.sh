{% extends '//die/c/make.sh' %}

{% block pkg_name %}
runit
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://smarden.org/runit/runit-{{self.version().strip()}}.tar.gz
190e11c1f8072b543bb6bd53850555c458d6e306d53df3fc1232d300c3e21b51
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
