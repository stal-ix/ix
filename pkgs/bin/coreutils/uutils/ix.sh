{% extends '//die/rust/cargo.sh' %}

{% block fetch %}
https://github.com/uutils/coreutils/archive/refs/tags/0.0.23.tar.gz
sha:cb10a4790e80900345db9a4a929d36ab0d6bb0a81cd3427730300cbae5be9178
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/iconv
{% endblock %}
