{% extends '//bin/sway/compositor/ix.sh' %}

{% block pkg_name %}
swayfx
{% endblock %}

{% block version %}
0.6
{% endblock %}

{% block fetch %}
https://github.com/WillPower3309/swayfx/archive/refs/tags/{{self.version().strip()}}.tar.gz
854f9d1468b8706718210e026d0bb0ddbc8370f750345fbbdd163f130c1b922d
{% endblock %}

{% block bld_libs %}
lib/scene/fx
{{super()}}
{% endblock %}
