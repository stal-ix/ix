{% extends '//bin/dash/mix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin; mv dash sh
{% endblock %}

{% block configure1 %}
sh ./configure \
    --prefix="${out}"  \
    --disable-lineedit \
    --enable-printf    \
    --enable-test
{% endblock %}
