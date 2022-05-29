{% extends '//bin/graphviz/2/ix.sh' %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/4.0.0/graphviz-4.0.0.tar.bz2
sha:af3c104607b9fe597b05c9a0b4ebd7bf7aa3562ae598f5b05e1f9428da76de10
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{{super()}}
{% endblock %}
