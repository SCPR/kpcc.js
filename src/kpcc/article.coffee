class kpcc.Article extends kpcc.ApiEntity
    @ENDPOINT       = "articles"
    @KEY_SINGULAR   = "article"
    @KEY_PLURAL     = "articles"

    attributes: [
        "id"
        "title"
        "short_title"
        "byline"
        "published_at"
        "teaser"
        "body"
        "public_url"
        "thumbnail"
    ]

    nested_objects: [
        "assets"
        "audio"
        "category"
        "attributions"
    ]
