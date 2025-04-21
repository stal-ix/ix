{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
rapidyaml
{% endblock %}

{% block version %}
0.4.1
{% endblock %}

{% block fetch %}
https://github.com/biojppm/rapidyaml/releases/download/v{{self.version().strip()}}/rapidyaml-{{self.version().strip()}}-src.tgz
sha:3c0a671a7a5aab972f7d259736d14beb9f428c4441f0c220dc0717a4946b495c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
