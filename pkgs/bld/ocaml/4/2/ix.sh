{% extends '//bld/ocaml/4/t/ix.sh' %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_tool %}
bld/ocaml/4/1
{{super()}}
{% endblock %}

{% block cpp_defines %}
{{super()}}
HAS_SYMLINK=1
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|$(MAKE.*otherlibrariesopt.*|echo 1|' -i Makefile
sed -e 's|$(MAKE.*ocamldoc.*|echo 1|' -i Makefile
{% endblock %}
