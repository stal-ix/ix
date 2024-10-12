{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/2.4.9/sbcl-2.4.9-source.tar.bz2
sha:9970e4ebc5d6943dc64d7ca1f52d9b5cd9fc94cef94d233213d78ec75f3605e2
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
