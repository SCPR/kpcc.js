class kpcc.Blog extends kpcc.ApiEntity
    @ENDPOINT       = "articles"
    @KEY_SINGULAR   = "article"
    @KEY_PLURAL     = "articles"

    attributes: [
        "title"
        "slug"
        "tagline"
        "description"
        "rss_url"
        "public_url"
    ]
