{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.etallen.com/cpuid/cpuid-20230120.src.tar.gz
sha:b89b41f8895d0d58fdbb0a54102bb490bc7c5828db2cd15be82d14d19463a579
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/perl
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
arch={{target.arch}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/* ./
sed -e 's|/usr/bin/perl|/usr/bin/env perl|' -i bin/cpuinfo2cpuid
{% endblock %}
