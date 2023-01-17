{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/papki/archive/refs/tags/1.0.119.tar.gz
sha:2e5730ab434d33b5f08ccc82977b3736edee30b3b7626b77df1934c123b17e31
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/svgren/utki
{% endblock %}
