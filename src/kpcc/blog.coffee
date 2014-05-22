class kpcc.Blog extends kpcc.ApiEntity
    @ENDPOINT       = "blogs"
    @KEY_SINGULAR   = "blog"
    @KEY_PLURAL     = "blogs"

    attributes: [
        "title"
        "slug"
        "tagline"
        "description"
        "rss_url"
        "public_url"
    ]
