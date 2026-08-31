{% extends '//die/c/make.sh' %}

{% block version %}
1.11.5
{% endblock %}

{% block pkg_name %}
scdoc
{% endblock %}

{% block fetch %}
https://git.sr.ht/~sircmpwn/scdoc/archive/{{self.version().strip()}}.tar.gz
98780bbdf16c1bce89ef3a8c0f537ac6e4ea77087b609e7698857614488a2a62
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
