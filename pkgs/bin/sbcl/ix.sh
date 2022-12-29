{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.7/sbcl-2.2.7-source.tar.bz2
sha:ec98996fdaa68009d98b4d7db2189271f2ad455ec322ca95a9c6aebf08bead6d
{% endblock %}

{% block bld_tool %}
bld/sbcl
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/zstd
{{super()}}
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}

{% block extern_symbols %}
{{super()}}
{% include 'nn' %}
{% endblock %}
