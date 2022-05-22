{% extends '//bin/kitty/t/ix.sh' %}

{% block bld_libs %}
lib/darwin/framework/IOKit
lib/darwin/framework/Cocoa
lib/darwin/framework/AppKit
lib/darwin/framework/Carbon
lib/darwin/framework/CoreText
lib/darwin/framework/CoreVideo
lib/darwin/framework/CoreGraphics
lib/darwin/framework/UserNotifications
{{super()}}
{% endblock %}
