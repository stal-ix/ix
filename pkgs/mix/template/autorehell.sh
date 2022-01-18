{% extends 'autohell.sh' %}

{% block conf_ver %}
2/69
{% endblock %}

{% block make_ver %}
1/16
{% endblock %}

{% block std_box %}
dev/build/auto/conf/{{self.conf_ver().strip()}}
dev/build/auto/make/{{self.make_ver().strip()}}
{{super()}}
{% endblock %}
