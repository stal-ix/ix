{% extends '//util/template.sh' %}

{% block fetch %}
# url https://files.pythonhosted.org/packages/80/21/ae597efc7ed8caaa43fb35062288baaf99a7d43ff0cf66452ddf47604ee6/Jinja2-3.0.1-py3-none-any.whl
# md5 b377af8123a32e992984222bff51e152
{% endblock %}

{% block deps %}
# bld env/std
{% endblock %}

{% block build %}
cd ${out} && $untar ${src}/*.whl
{% endblock %}

{% block env %}
export PYTHONPATH="${out}:\${PYTHONPATH}"
{% endblock %}
