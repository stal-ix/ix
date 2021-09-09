{% if mix.platform.target.os == 'linux' %}
# run boot/stage/1/sbase
{% endif %}
{% if mix.platform.target.os == 'darwin' %}
# run boot/stage/1/bsdpatch
{% endif %}
# run boot/stage/1/heirloom boot/stage/1/bmake boot/stage/1/which boot/stage/0/env
