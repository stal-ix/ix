{% extends '//mix/template/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/b09c62c9729890a54a485b90bb223d71cf8456ae.zip
53b05459fac7fead658106148ab664dc
{% endblock %}

{% block bld_libs %}
pypi/pygments/mix.sh
lib/python/mix.sh
{% endblock %}

{% block bin %}ted.bin{% endblock %}
{% block entry_point %}ted{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin && mv ted.bin ted
{% endblock %}
