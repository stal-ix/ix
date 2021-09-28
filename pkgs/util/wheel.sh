{% extends '//util/template.sh' %}

{% block fetch %}
# url {{self.url().strip()}}
# md5 {{self.md5().strip()}}
{% endblock %}

{% block deps %}
# bld env/std
{% block wheel_deps %}
{% endblock %}
{% endblock %}

{% block build %}
cd ${out} && mkdir module && cd module && ${untar} ${src}/*.whl
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/module:\${PYTHONPATH}"
{% endblock %}
