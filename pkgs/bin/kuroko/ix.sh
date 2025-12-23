{% extends 't/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
{% for x in self.modules() | parse_list %}
lib/dl(dl_for=bin/kuroko/modules,dl_lib={{x}})
{% endfor %}
{% endblock %}
