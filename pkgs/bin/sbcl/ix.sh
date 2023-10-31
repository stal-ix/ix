{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://github.com/sbcl/sbcl/archive/refs/tags/sbcl-2.3.10.tar.gz
sha:8b9d59ff32630b9c62f5046c7f4334e61c81d024d47531053523529bfaac3767
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
