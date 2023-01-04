{% extends '//bin/hypr/t/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/6dc7f3321e04dca1c588b930856cae1fcc90f40a.zip
sha:4b5230d303e040868dc45a92713a32a7063805c752df7b3ab57470bc48db8310
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|pLS->screenBuffer.data|(char*)pLS->screenBuffer.data|' -i src/hyprpicker.cpp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpicker ${out}/bin/
{% endblock %}
