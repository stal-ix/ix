{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/2.4.1/sbcl-2.4.1-source.tar.bz2
sha:da4f9486fad413d3af7abb1b09269325fdb4bff7e7b88f2195ddee743263cf7e
{% endblock %}

{% block bld_tool %}
bld/sbcl
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/zstd
lib/gmp/dl
lib/mpfr/dl
{{super()}}
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}
