BEGIN {
    show = 1
    skipline = 0
}

/tkinter/ {
    show = 0
}

/binasc/ {
    show = 1
}

/^# / {
    skipline = 1
}

/^#.*SSL/ {
    skipline = 1
}

/^#\*/ {
    skipline = 1
}

/\\/ {
    skipline = 1
}

{
    if (show && !skipline) {
        gsub(/^#/, "")

        print
    }

    skipline = 0
}
