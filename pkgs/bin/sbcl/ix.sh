{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.11/sbcl-2.2.11-source.tar.bz2
sha:3607d68016731880845ced5d5d55c6054cc49f19121a15027e6c5607ae8496df
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
