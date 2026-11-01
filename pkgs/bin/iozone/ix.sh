{% extends '//die/c/make.sh' %}

{# repology reads the release number NNN as 3.NNN #}
{% block version %}
3.511
{% endblock %}

{% block pkg_name %}
iozone3
{% endblock %}

{% block fetch %}
https://www.iozone.org/src/current/iozone3_{{self.version().strip() | field(1)}}.tgz
1aa00bc3cd627ec46ca17aa78c8fabd143d32025155c741f49392b1bdd776298
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block unpack %}
{{super()}}
cd src/current
make clean
{% endblock %}

{% block make_target %}
linux
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp iozone fileop ${out}/bin/
{% endblock %}
