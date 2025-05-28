!(bind! &op (new-space))
!(add-atom &op (isExecuted ))
!(add-atom &op (isExecuted))
!(add-atom &op (isExecuted $id))
!(add-atom &op (isExecuted $id $tv))

!(match &op (isExecuted abebe) $id)
