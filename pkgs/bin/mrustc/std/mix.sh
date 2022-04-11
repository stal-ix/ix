{% extends '//bin/mrustc/t/mix.sh' %}

{% block install %}
cp -R ${OUTPUT_DIR} ${out}/lib
{% endblock %}

{% block env_lib %}
export MRUSTC_STD="${out}/lib"
{% endblock %}
