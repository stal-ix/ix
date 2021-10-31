def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
        },
        'runtime': {
            'depends': [
                'tool/pv/mix.sh',
                'tool/compress/unzip/mix.sh',
                'tool/compress/bsdtar/mix.sh',
            ],
        },
    }
