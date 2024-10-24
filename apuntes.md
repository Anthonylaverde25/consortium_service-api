## Apuntes sobre device token auth:
en rails, especialmente al trabajar con formularios y parametros, es comun usar params.requiere y params.permit, dentro de un contexto de objecto ('user': {name})
esto con el proposito de garantizar que se esten manejando un conjunto especifico de parametros,es decir parametros relacionados entre si anidados en un objecto

pero al emplear device token auth existe una diferencia (no emplea params.requiere), por defecto, esta gema no espera que los parametros esten anidados bajo un objecto. en su lugar los parametros se envian directamente en el cuerpo de la solicitud como un JSON sin astar anidado
