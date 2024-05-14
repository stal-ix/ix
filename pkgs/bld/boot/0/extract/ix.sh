{% extends '//die/env.sh' %}

{% block env %}
extract0() (
    {{ix_extract}} ${1}
)

extract1() (
    mkdir _; (
        cd _; extract0 ${1}; cd *; mv $(ls -A) ../../
    ); rm -r _
)
{% endblock %}
