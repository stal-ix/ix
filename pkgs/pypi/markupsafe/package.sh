{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e/MarkupSafe-2.0.1.tar.gz
# md5 892e0fefa3c488387e5cc0cad2daa523
{% endblock %}

{% block deps %}
# bld env/std
{% endblock %}

{% block build %}
cd ${out} && mkdir module && cd module && ${untar} ${src}/M*
ln -s Ma*/src/markupsafe ./
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/module:\${PYTHONPATH}"
{% endblock %}
