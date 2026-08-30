{% extends '//pip/jsonschema/t/ix.sh' %}

# noauto

{% block fetch %}
https://files.pythonhosted.org/packages/c1/97/c698bd9350f307daad79dd740806e1a59becd693bd11443a0f531e3229b3/jsonschema-4.17.3-py3-none-any.whl
a870ad254da1a8ca84b6a2905cac29d265f805acc57af304784962a2aa6508f6
{% endblock %}

{% block run_deps %}
pip/attrs/ix.sh
pip/pyrsistent/ix.sh
{% endblock %}

{% block lib_deps %}
pip/attrs/ix.sh
pip/pyrsistent/ix.sh
{% endblock %}
