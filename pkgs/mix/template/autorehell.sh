{% extends 'autohell.sh' %}

{% block conf_ver %}
2/69
{% endblock %}

{% block make_ver %}
1/16
{% endblock %}

{% block std_box %}
bin/auto/conf/{{self.conf_ver().strip()}}
bin/auto/make/{{self.make_ver().strip()}}
{{super()}}
{% endblock %}
