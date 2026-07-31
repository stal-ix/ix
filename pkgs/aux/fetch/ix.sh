{% extends 't/ix.sh' %}

{% block bld_tool %}
bld/fetch
bld/extract
{{super()}}
{% endblock %}

{% block step_unpack %}
set -xue
mkdir net
cd net
fetch "{{url}}" "{{fetch_sha or '__skip__'}}"
cd ..
mkdir src
cd src
extract 1 ../net/*
{% if refine_unpack %}
{{refine_unpack | b64d}}
{% endif %}
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
