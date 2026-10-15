{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
utki
{% endblock %}

{% block version %}
1.1.298
{% endblock %}

{% block fetch %}
https://github.com/cppfw/utki/archive/refs/tags/{{self.version().strip()}}.tar.gz
662f96ea12a364afd08fc0467109afe1a47adc867a025989c396233669a195f7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
