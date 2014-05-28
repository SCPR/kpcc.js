class kpcc.Entity
    attributes      : []
    nested_objects  : []

    constructor: (json) ->
        for attribute in @attributes
            @[attribute] = json[attribute]

        for key in @nested_objects
            map     = kpcc.NESTED_OBJECTS[key]
            nested  = json[key]

            # If we didn't map this, or the JSON doesn't contain
            # this key, then there's nothing we can do.
            continue unless map and nested

            if map.plural
                @[key] = []
                @[key].push(new kpcc[map.klass](obj)) for obj in nested
            else
                @[key] = new kpcc[map.klass](nested)
