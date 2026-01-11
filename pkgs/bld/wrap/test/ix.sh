{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/wrap/cc/plugins/norm
bld/wrap/cc/plugins/compile
{% endblock %}

{% block build %}
>1.c
>2.cpp
cc -o test 1.c 2.cpp
cc -o test.so -shared 1.c 2.cpp
{% endblock %}
