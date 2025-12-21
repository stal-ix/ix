{% extends '//bin/kuroko/t/t/ix.sh' %}

{% block install %}
{{super()}}
{% for x in ix.parse_list(self.modules()) %}
mv ${out}/share/{{x}}.so ${out}/lib/lib{{x}}.a
{% endfor %}
{% endblock %}
