{% extends '//die/c/make.sh' %}

{% block version %}
20250316
{% endblock %}

{% block pkg_name %}
cpuid
{% endblock %}

{% block fetch %}
http://www.etallen.com/cpuid/cpuid-{{self.version().strip()}}.src.tar.gz
sha:3ef849e964a027c9575470c4dcc80944b4cb6ac214aca02feec6b249308fa0f5
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
