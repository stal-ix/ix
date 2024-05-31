{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/sbcl/sbcl/2.4.5/sbcl-2.4.5-source.tar.bz2
sha:4df68e90c9031807642b4b761988deb5bf6a1bd152c4723482834efa735a7bd1
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
