def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
        },
        'runtime': {
            'depends': [
                'tool/pv',
                'tool/compress/unzip',
                'tool/compress/bsdtar',
            ],
        },
    }
