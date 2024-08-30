{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/2.4.8/sbcl-2.4.8-source.tar.bz2
sha:fc6ecdcc538e80a14a998d530ccc384a41790f4f4fc6cd7ffe8cb126a677694c
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
