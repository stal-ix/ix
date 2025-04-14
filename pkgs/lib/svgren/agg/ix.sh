{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
agg
{% endblock %}

{% block version %}
2.8.33
{% endblock %}

{% block fetch %}
https://github.com/cppfw/agg/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:949f5d116143fd009e85f4667e0c9466784966acaf1f878f1c45f2b61c5e7607
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
