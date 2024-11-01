{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/2.4.10/sbcl-2.4.10-source.tar.bz2
sha:ceeb396b69d2913eee04841c2af6beca5c342ce1464c3fe3e453f2de10c5e2f8
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
