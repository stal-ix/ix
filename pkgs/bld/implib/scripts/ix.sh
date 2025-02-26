{% extends '//die/std/ix.sh' %}

{% block version %}
b6f5478959e1ccfd520a0d51e21c7080ac914a79
{% endblock %}

{% block fetch %}
https://github.com/yugr/Implib.so/archive/{{self.version().strip()}}.zip
sha:9c85eed64412ef35b29e5f34c86e33a24d0c3f4b77c553f206ed9a9be4751b47
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir ${out}/bin
cd ${out}/bin
extract 1 ${src}/{{self.version().strip()}}.zip
chmod +x implib-gen.py
{% endblock %}
