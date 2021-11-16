{% extends '//mix/template/cargo.sh' %}

{% block fetch %}
https://github.com/uutils/coreutils/archive/refs/tags/0.0.8.tar.gz
a45b94c5106f5985a05fef42dac1dc98
{% endblock %}

{% block bld_libs %}
lib/c++/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block cargo_options %}
--features macos
{% endblock %}
