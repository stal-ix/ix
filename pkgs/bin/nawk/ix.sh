{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/onetrueawk/awk/archive/refs/tags/20240311.tar.gz
sha:5d46ab41595bcade23928a0aa9cff16972ee46e0a904a2a28c318324ccb669ce
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp a.out ${out}/bin/nawk
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
