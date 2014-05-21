class kpcc.Alert extends kpcc.ApiEntity
    @ENDPOINT       = "alerts"
    @KEY_SINGULAR   = "alert"
    @KEY_PLURAL     = "alerts"

    attributes: [
        "id"
        "headline"
        "type"
        "published_at"
        "teaser"
        "public_url"
        "mobile_notification_sent"
        "email_notification_sent"
    ]
