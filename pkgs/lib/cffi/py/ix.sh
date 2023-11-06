{% extends '//lib/cffi/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv cffi* lib
{% endblock %}

{% block env %}
{{super()}}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
