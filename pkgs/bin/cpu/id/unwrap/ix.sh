{% extends '//die/c/make.sh' %}

{% block version %}
20260220
{% endblock %}

{% block pkg_name %}
cpuid
{% endblock %}

{% block fetch %}
http://www.etallen.com/cpuid/cpuid-{{self.version().strip()}}.src.tar.gz
e7620fd75ae591171f110c49b99a39128933a0caad023b68d4a384b9be0b8ffb
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/perl
bld/shebangs
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
arch={{target.arch}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/* ./
{% endblock %}
