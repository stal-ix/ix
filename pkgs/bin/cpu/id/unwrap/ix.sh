{% extends '//die/c/make.sh' %}

{% block version %}
20260503
{% endblock %}

{% block pkg_name %}
cpuid
{% endblock %}

{% block fetch %}
http://www.etallen.com/cpuid/cpuid-{{self.version().strip()}}.src.tar.gz
8ee10fb48d4aa20c484a75d6852883710286ed2975c314bda6d0b0383908cbfe
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
