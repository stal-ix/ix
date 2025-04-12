{% extends '//lib/svgren/t/ix.sh' %}

{% block version %}
1.1.224
{% endblock %}

{% block fetch %}
https://github.com/cppfw/utki/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:3063f2ba04a58ee81014f97df37ed29898babed82c06808f4f47078b4d20cec2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
