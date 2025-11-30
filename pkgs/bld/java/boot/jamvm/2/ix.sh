{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/java/boot/ecj/3/javac
{% endblock %}
