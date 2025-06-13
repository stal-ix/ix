{% extends '//lib/boost/t/ix.sh' %}

{% block fetch %}
https://github.com/boostorg/boost/releases/download/boost-1.85.0/boost-1.85.0-b2-nodocs.tar.xz
09f0628bded81d20b0145b30925d7d7492fd99583671586525d5d66d4c28266a
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|len + 1}|int(len + 1)}|' -i ${out}/include/boost/process/detail/posix/executor.hpp
{% endblock %}
