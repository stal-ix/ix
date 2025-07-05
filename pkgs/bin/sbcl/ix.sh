{% extends '//bin/sbcl/t/ix.sh' %}

{% block version %}
2.5.6
{% endblock %}

{% block pkg_name %}
sbcl
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/{{self.version().strip()}}/sbcl-{{self.version().strip()}}-source.tar.bz2
6dd7cebff6d38f2e41baece14c4c56a32e968828aaa4171b8e840852c5b43f35
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
