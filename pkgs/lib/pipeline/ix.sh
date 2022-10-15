{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://download.savannah.nongnu.org/releases/libpipeline/libpipeline-1.5.6.tar.gz
sha:60fbb9e7dc398528e5f3a776af57bb28ca3fe5d9f0cd8a961ac6cebfe6e9b797
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
