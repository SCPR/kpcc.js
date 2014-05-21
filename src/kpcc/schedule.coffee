class kpcc.Schedule extends kpcc.ApiEntity
    @ENDPOINT       = "schedule"
    @KEY_SINGULAR   = "schedule_occurrence"
    @KEY_PLURAL     = "schedule_occurrences"

    attributes: [
        "title"
        "public_url"
        "starts_at"
        "ends_at"
        "is_recurring"
    ]

    nested_objects: [
        "program"
    ]


    @at: (time, cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT, "at")
            data:
                time: time

            success: (data, textStatus, jqXHR) =>
                @_singular_cb(data, cb)

    # Alias, since @find is meaningless for this class
    # We want to override because we're inheriting from ApiEntity
    # and if this method was called without being overridden it'd
    # be broken.
    @find = @at


    @current: (cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT, "current")

            success: (data, textStatus, jqXHR) =>
                @_singular_cb(data, cb)
