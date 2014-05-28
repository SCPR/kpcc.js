class kpcc.Program extends kpcc.ApiEntity
    @ENDPOINT       = "programs"
    @KEY_SINGULAR   = "program"
    @KEY_PLURAL     = "programs"

    attributes: [
        "title"
        "slug"
        "host"
        "air_status"
        "twitter_handle"
        "airtime"
        "description"
        "podcast_url"
        "rss_url"
        "public_url"
    ]

    @all = @default
