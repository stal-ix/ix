{% extends '//mix/template/cargo.sh' %}

{% block fetch %}
https://github.com/sharkdp/bat/archive/refs/tags/v0.18.3.tar.gz
df1b1e7cc3ea8922f6a287b5c2abb413
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}
