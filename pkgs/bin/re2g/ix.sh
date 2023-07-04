{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/akamai/re2g/archive/refs/tags/v0.1.35.tar.gz
sha:e4876e4128773e9466ed4d95af116a89f840baeb8c69985b0632781500630542
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/re2
{% endblock %}

{% block cpp_includes %}
${PWD}/build
{% endblock %}

{% block patch %}
sed -e 's|RE2::RE2|re2::RE2|' -i src/re2g.cc
{% endblock %}
