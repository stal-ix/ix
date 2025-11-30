{% extends '//bld/java/boot/jamvm/2/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/java/boot/ecj/4/javac
{% endblock %}
