class kpcc.Episode extends kpcc.ApiEntity
    @ENDPOINT       = "episodes"
    @KEY_SINGULAR   = "episode"
    @KEY_PLURAL     = "episodes"

    attributes: [
        "title"
        "summary"
        "air_date"
        "public_url"
    ]

    nested_objects: [
        "assets"
        "audio"
        "program"
        "segments"
    ]
