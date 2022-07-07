{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
BUILD_TRAINING_TOOLS=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*exec_prefix=.*||' -i ${out}/lib/pkgconfig/tesseract.pc
{% endblock %}
