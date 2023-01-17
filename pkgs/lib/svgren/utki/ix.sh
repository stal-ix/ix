{% extends '//lib/svgren/t/ix.sh' %}

{% block fetch %}
https://github.com/cppfw/utki/archive/refs/tags/1.1.182.tar.gz
sha:0f433eb3670b9ebf53480f03e47bf6221664d00998a932c9c4f435ecaa7103ed
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
