{% if mix.platform.target.os == 'linux' %}
# run boot/stage/2/sbase
{% endif %}
{% if mix.platform.target.os == 'darwin' %}
# run boot/stage/2/bsdpatch
{% endif %}
# run boot/stage/2/heirloom boot/stage/2/bmake boot/stage/2/which boot/stage/0/env
