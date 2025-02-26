{% extends '//die/std/ix.sh' %}

{% block version %}
4eab9f58090f6f53e78533ce53e65c4125600872
{% endblock %}

{% block fetch %}
https://github.com/yugr/Implib.so/archive/{{self.version().strip()}}.zip
sha:ba1e05b89df39c414042cb042a6283f69d54222af9bf7d6fd6337d8554ededfc
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
