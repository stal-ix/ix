{% extends '//die/c/make.sh' %}

{% block pkg_name %}
runit
{% endblock %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://smarden.org/runit/runit-{{self.version().strip()}}.tar.gz
sha:95ef4d2868b978c7179fe47901e5c578e11cf273d292bd6208bd3a7ccb029290
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
