{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|/usr/bin/file|file|' -i "${l}"
done
{% endblock %}

{% block std_box %}
{{super()}}
bld/fake(tool_name=makeinfo)
{% endblock %}
