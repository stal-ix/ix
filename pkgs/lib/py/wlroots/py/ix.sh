{% extends '//lib/py/wlroots/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv pywl* lib
cd lib
cp -R EGG-INFO pywlroots-0.16.6-py3.12.egg-info
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
