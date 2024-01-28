{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v1.6.41.tar.gz
sha:d236ef40d8733b5a1f5dfd3f8386a7741a0bdd896b6677be0a9cec9747296f4c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
