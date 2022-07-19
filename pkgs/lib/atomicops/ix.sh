{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/ivmai/libatomic_ops/archive/914862752503cac5c3e7e5be8a8af2f5b97153a8.zip
sha:a1b21deafc774063b40384757b2b70e8f3be8ba685fa5544a81393c99609764a
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block cmake_flags %}
enable_docs=OFF
{% endblock %}
