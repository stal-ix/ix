{% extends '//bin/kuroko/t/t/ix.sh' %}

{% block install %}
{{super()}}
{% for x in self.modules() | parse_list %}
mv ${out}/share/{{x}}.so ${out}/lib/lib{{x}}.a
{% endfor %}
{% endblock %}
