window.kpcc = {
    API_ROOT: "http://www.scpr.org/api/v3/"

    NESTED_OBJECTS: {
        "category"      : "Category"
        "assets"        : "Asset"
        "audio"         : "Audio"
        "attributions"  : "Attribution"
        "program"       : "Program"
        "location"      : "Location"
        "sponsor"       : "Sponsor"
    }

    api_url: (path) ->
        return API_ROOT + path
}
