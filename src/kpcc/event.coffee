class kpcc.Event extends kpcc.ApiEntity
    @ENDPOINT       = "events"
    @KEY_SINGULAR   = "event"
    @KEY_PLURAL     = "events"

    attributes = [
        "id"
        "title"
        "public_url"
        "starts_at"
        "ends_at"
        "is_all_day"
        "teaser"
        "body"
        "past_tense_body"
        "hashtag"
        "event_type"
        "is_kpcc_event"
        "rsvp_url"
    ]

    nested_objects = [
        "assets"
        "audio"
        "program"
        "location"
        "sponsor"
    ]
