{% extends '//lib/svgren/t/ix.sh' %}

{% block version %}
0.2.8
{% endblock %}

{% block fetch %}
https://github.com/cppfw/cssom/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:8c963a93db06923639b65c3cbadc390c7ce45a4264d9cc4af891398dfdb2b17b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/utki
lib/svgren/papki
{% endblock %}
