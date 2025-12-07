{% extends '//bld/ocaml/4/t/ix.sh' %}

{% block bld_tool %}
bld/ocaml/4/1
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
cp $(which ocamlc.byte) boot/ocamlc
cp $(which ocamllex.byte) boot/ocamllex
{% endblock %}
