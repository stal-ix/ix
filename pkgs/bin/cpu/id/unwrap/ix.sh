{% extends '//die/c/make.sh' %}

{% block version %}
20250513
{% endblock %}

{% block pkg_name %}
cpuid
{% endblock %}

{% block fetch %}
http://www.etallen.com/cpuid/cpuid-{{self.version().strip()}}.src.tar.gz
sha:6f474a22b5848488e454b01a31db80eb958d55674b5339533fc0e6aeb793626b
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
