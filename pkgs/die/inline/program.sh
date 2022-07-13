{% extends 'common.sh' %}

{% block build %}
{{super()}}
cc -o {{self.name().strip()}} *.o
{% endblock %}
