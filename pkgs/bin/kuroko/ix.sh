{% extends 't/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
{% for x in ix.parse_list(self.modules()) %}
lib/dl(dl_for=bin/kuroko/modules,dl_lib={{x}})
{% endfor %}
{% endblock %}
