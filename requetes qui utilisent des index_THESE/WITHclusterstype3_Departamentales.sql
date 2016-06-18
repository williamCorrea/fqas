explain analyze
with cl as(
select * from "syntec_vectors"
where  ("p_1"=4 and "p_2"=6)
),
cl2 as (
select "cl1" 
from "syntec_MinDist",
cl
where "minDist"<=4 and "cl2"=cl."clusterID"
union
select "cl2" 
from "syntec_MinDist",
cl
where "minDist"<=4 and "cl1"=cl."clusterID"
)
select cl.idvector, v2.idvector
from 
"syntec_vectors" as v2,
cl 
where 
v2."clusterID"=cl."clusterID" 
and 
v2."idvector"<>cl."idvector" 
and
v2.x between cl.x-4 and cl.x+4 and
v2.y between cl.y-4 and cl.y+4

--abs(cl.x-v2.x)<=1
--and 
--abs(cl.y-v2.y)<=1

union 
select null,v4.idvector
from
"syntec_vectors" as v4,
cl,
cl2
where 
v4."clusterID"=cl2."cl1" and
v4.x between cl.x-4 and cl.x+4 and
v4.y between cl.y-4 and cl.y+4