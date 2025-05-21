{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
python:MarkupSafe
{% endblock %}

{% block version %}
3.0.2
{% endblock %}

{% block fetch %}
https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e/MarkupSafe-{{self.version().strip()}}.tar.gz
sha:e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
{% endblock %}

{% block build %}
cd ${out}
mkdir lib
cd lib
extract0 ${src}/M*
ln -s Ma*/src/markupsafe ./
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
