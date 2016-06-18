explain analyze
with cl as(
select * from "adbis_clusterTable"
where  ("elem1"=65 and "elem2"=83)
),
cl2 as (
select "cl1" 
from "adbis_MinDist",
cl
where "minDist"<=1.0 and "cl2"=cl."id"
union
select "cl2" 
from "syntec_MinDist",
cl
where "minDist"<=1.0 and "cl1"=cl."id"
)
--ojo will, que incluso si conoces la distancia intra-cluster del vector base,
--estas verificando vector by vector que la distorsion maxima no se depasada
select cl.vector, v2.vector
from 
"adbis_clusterTable" as v2,
cl 
where 
v2."id"=cl."id" 
and 
v2."vector"<>cl."vector" 
and
v2.v2 between cl.v2-1.0 and cl.v2+1.0 and
v2.v3 between cl.v3-1.0 and cl.v3+1.0 and
v2.v4 between cl.v4-1.0 and cl.v4+1.0 and
v2.v8 between cl.v8-1.0 and cl.v8+1.0 and
v2.v9 between cl.v9-1.0 and cl.v9+1.0 and
v2.v10 between cl.v10-1.0 and cl.v10+1.0

--abs(cl.x-v2.x)<=1
--and 
--abs(cl.y-v2.y)<=1

union 
select null,v4.vector
from
"adbis_clusterTable" as v4,
cl,
cl2
where 
v4."id"=cl2."cl1" and
v4.v2 between cl.v2-1.0 and cl.v2+1.0 and
v4.v3 between cl.v3-1.0 and cl.v3+1.0 and
v4.v4 between cl.v4-1.0 and cl.v4+1.0 and
v4.v8 between cl.v8-1.0 and cl.v8+1.0 and
v4.v9 between cl.v9-1.0 and cl.v9+1.0 and
v4.v10 between cl.v10-1.0 and cl.v10+1.0