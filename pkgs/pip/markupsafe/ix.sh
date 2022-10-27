{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e/MarkupSafe-2.0.1.tar.gz
sha:594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a
{% endblock %}

{% block build %}
cd ${out}
mkdir lib
cd lib
extract0 ${src}/M*
ln -s Ma*/src/markupsafe ./
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
