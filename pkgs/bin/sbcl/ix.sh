{% extends '//bin/sbcl/t/ix.sh' %}

{% block version %}
2.5.5
{% endblock %}

{% block pkg_name %}
sbcl
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/{{self.version().strip()}}/sbcl-{{self.version().strip()}}-source.tar.bz2
6502670afb361ba9be44a2fafe9af9b59e7b24ae509a791a66b5481f2955950b
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
