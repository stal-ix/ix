{% extends '//lib/icu/archive/t/ix.sh' %}

{% block install %}
{{super()}}
test -d ${out}/share/icu/{{self.version().strip()}}
{% endblock %}

{% block env %}
export ICU_DATA="${out}/share/icu/{{self.version().strip()}}"
{% endblock %}
