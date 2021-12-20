export bld=${PWD}; mkpushd ${tmp}/tools

mkpushd bt
export PATH="${PWD}:${PATH}"
{% include 'bt.sh' %}
popd

mkpushd tc
{% block setup_compiler %}
{% endblock %}
export PATH="${PWD}:${PATH}"
popd

mkpushd ut
{% block setup_tools %}
{% endblock %}
export PATH="${PWD}:${PATH}"
popd

popd
