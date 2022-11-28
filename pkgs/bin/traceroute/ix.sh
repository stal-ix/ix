{% extends '//die/c/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/traceroute/traceroute/traceroute-2.1.0/traceroute-2.1.0.tar.gz
sha:3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block patch %}
sed -e 's|-lm||' -i Make.rules
{% endblock %}
