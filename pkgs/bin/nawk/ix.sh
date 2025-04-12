{% extends '//die/c/make.sh' %}

{% block version %}
20240422
{% endblock %}

{% block fetch %}
https://github.com/onetrueawk/awk/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:4793404735db5ea79f790cf865bf4fe875f9c5c23b1b8da186349f54b3a32281
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
