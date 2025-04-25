{% extends '//die/c/make.sh' %}

{% block version %}
20250419
{% endblock %}

{% block pkg_name %}
cpuid
{% endblock %}

{% block fetch %}
http://www.etallen.com/cpuid/cpuid-{{self.version().strip()}}.src.tar.gz
sha:31ccfc03f93dd8848a6798f274fa03791f5c3bfbb1a767fe2086a69ce3727acb
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
