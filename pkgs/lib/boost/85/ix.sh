{% extends '//lib/boost/t/ix.sh' %}

{% block fetch %}
https://boostorg.jfrog.io/artifactory/main/release/1.85.0/source/boost_1_85_0.tar.bz2
sha:7009fe1faa1697476bdc7027703a2badb84e849b7b0baad5086b087b971f8617
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|len + 1}|int(len + 1)}|' -i ${out}/include/boost/process/detail/posix/executor.hpp
{% endblock %}
