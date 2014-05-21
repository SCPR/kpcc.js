class kpcc.ScheduleOccurrence extends kpcc.ApiEntity
    @ENDPOINT       = "schedule"
    @KEY_SINGULAR   = "schedule_occurrence"
    @KEY_PLURAL     = "schedule_occurrences"

    attributes = [
        "title"
        "public_url"
        "starts_at"
        "ends_at"
        "is_recurring"
    ]

    nested_objects = [
        "program"
    ]
