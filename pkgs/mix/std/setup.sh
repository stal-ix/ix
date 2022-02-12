mkpushd ${tmp}/bin

# setup build tools
mkpushd bt
export PATH="${PWD}:${PATH}"

(
{% include 'bt.sh' %}
)

popd

# setup toolchain
mkpushd tc

{% block setup_compiler %}
: skip compiler setup
{% endblock %}

export PATH="${PWD}:${PATH}"
popd

# setup user tools
mkpushd ut

(
{% block setup_tools %}
: skip user tools
{% endblock %}
)

export PATH="${PWD}:${PATH}"
popd

popd
