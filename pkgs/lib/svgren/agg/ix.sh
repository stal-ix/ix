{% extends '//lib/svgren/t/ix.sh' %}

{% block pkg_name %}
agg
{% endblock %}

{% block version %}
2.8.42
{% endblock %}

{% block fetch %}
https://github.com/cppfw/agg/archive/refs/tags/{{self.version().strip()}}.tar.gz
4344db1b7714534472a148306c16fa4fd37226c9fd676fc68e3e332c54bcd6d0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
{{super()}}
sed -i 's/$(shell myci-deb-version\.sh)/{{self.version().strip()}}/' pkg-config/makefile
{% endblock %}
