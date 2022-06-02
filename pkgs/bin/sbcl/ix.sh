{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.2.5/sbcl-2.2.5-source.tar.bz2
sha:8584b541370fd6ad6e58d3f97982077dfcab240f30d4e9b18f15da91c2f13ed1
{% endblock %}

{% block bld_tool %}
bin/sbcl/boot
{{super()}}
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}

{% block extern_symbols %}
{{super()}}
listify_rest_arg
make_list
os_context_pc
set_os_context_pc
os_context_flags_addr
{% endblock %}
