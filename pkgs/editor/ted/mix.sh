{% extends '//mix/template/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/3c3f54a69b806bd7eb96f4c56189ce2a7f0507c5.zip
fe51001993fc27ecd2156b2eee5616e1
{% endblock %}

{% block bld_deps %}
pypi/pygments/mix.sh
lib/python/3/10/mix.sh
tool/compress/upx/mix.sh
env/std/0/mix.sh
{% endblock %}

{% block bin %}ted.bin{% endblock %}
{% block entry_point %}ted{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin && mv ted.bin ted
{% endblock %}
