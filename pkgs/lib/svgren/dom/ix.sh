{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/svgdom/archive/refs/tags/0.4.3.tar.gz
sha:136c119432e61b27779c8b2c42bd71aabeff98e9f99832d04a345bbf6300670f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/svgren/r4
lib/svgren/cssom
lib/svgren/mikroxml
{% endblock %}
