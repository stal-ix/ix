{% extends '//bin/sbcl/t/ix.sh' %}

{% block version %}
2.6.10
{% endblock %}

{% block pkg_name %}
sbcl
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/{{self.version().strip()}}/sbcl-{{self.version().strip()}}-source.tar.bz2
c23eac1d0aa9ae0add7eb741f3c91b816f5ce216147f37b99da1578e5261b17c
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
