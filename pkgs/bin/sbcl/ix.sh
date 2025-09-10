{% extends '//bin/sbcl/t/ix.sh' %}

{% block version %}
2.5.8
{% endblock %}

{% block pkg_name %}
sbcl
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/{{self.version().strip()}}/sbcl-{{self.version().strip()}}-source.tar.bz2
a7603e855095f635de021710a4e720d74d0b3e7c3e7ac520fe358897f586a9ae
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
