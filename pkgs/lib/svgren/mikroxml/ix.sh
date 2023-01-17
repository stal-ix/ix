{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/mikroxml/archive/refs/tags/0.1.53.tar.gz
sha:8b7bce82328db531dbce71b99ad8d056737ccdcf4f75ea2168274939725e113a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/utki
{% endblock %}
