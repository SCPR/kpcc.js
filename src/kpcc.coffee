window.kpcc = {
    API_ROOT: "http://www.scpr.org/api/v3/"

    NESTED_OBJECTS: {
        "category"      : kpcc.Category
        "assets"        : kpcc.Asset
        "audio"         : kpcc.Audio
        "attributions"  : kpcc.Attribution
        "program"       : kpcc.Program
        "location"      : kpcc.Location
        "sponsor"       : kpcc.Sponsor
    }

    api_url: (path) ->
        return API_ROOT + path
}
