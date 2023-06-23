{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v1.6.40.tar.gz
sha:62d25af25e636454b005c93cae51ddcd5383c40fa14aa3dae8f6576feb5692c2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
