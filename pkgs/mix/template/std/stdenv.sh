{% block shell %}
dev/tool/dash/mix.sh
{% endblock %}

{% block box %}
gnu/box/mix.sh
{% endblock %}

{% block decompressor %}
tool/pv/mix.sh
tool/compress/unzip/mix.sh
lib/archive/mix.sh(opt=O2;ICF;LTO)
{% endblock %}
