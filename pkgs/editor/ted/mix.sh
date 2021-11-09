{% extends '//mix/template/python/bin.sh' %}

{% block fetch %}
https://github.com/pg83/ted/archive/3c3f54a69b806bd7eb96f4c56189ce2a7f0507c5.zip
fe51001993fc27ecd2156b2eee5616e1
{% endblock %}

{% block bld_deps %}
{{'sys/framework/SystemConfiguration/mix.sh' | darwin}}
pypi/pygments/mix.sh
dev/lang/python/3/10/lib/mix.sh
tool/compress/upx/mix.sh
env/std/0/mix.sh
{% endblock %}

{% block bin %}ted.bin{% endblock %}
{% block entry_point %}ted{% endblock %}

{% block postinstall %}
cd ${out}/bin && mv ted.bin ted
{% endblock %}
