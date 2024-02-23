{% extends 't/ix.sh' %}

{% block bld_tool %}
bld/fetch
bld/extract
{{super()}}
{% endblock %}

{% block step_unpack %}
mkdir net
cd net
fetch "{{url}}"
cd ..
mkdir src
cd src
extract 1 ../net/*
{% endblock %}
