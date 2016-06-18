with cl as(
select * from "adbis_clusterTable_grille"
where  ("elem1"=10 and "elem2"=70)
),
cl2 as (
select "cl1" 
from "result_Cluster_Grille_minDist",
cl
where "minDist"<=0.8 and "cl2"=cl."id"
union
select "cl2" 
from "result_Cluster_Grille_minDist",
cl
where "minDist"<=0.8 and "cl1"=cl."id"
)
select cl.vector, v2.vector
from 
"adbis_clusterTable_grille" as v2,
cl 
where 
v2."id"=cl."id" 
and 
v2."vector"<>cl."vector" and
(v2."elem1"=69 or v2."elem2"=69)
and
v2.v2 between cl.v2-0.8 and cl.v2+0.8 and
v2.v3 between cl.v3-0.8 and cl.v3+0.8 and
v2.v4 between cl.v4-0.8 and cl.v4+0.8 and
v2.v8 between cl.v8-0.8 and cl.v8+0.8 and
v2.v9 between cl.v9-0.8 and cl.v9+0.8 and
v2.v10 between cl.v10-0.8 and cl.v10+0.8

union 
select null,v4.vector
from
"adbis_clusterTable_grille" as v4,
cl,
cl2
where 
v4."id"=cl2."cl1" and
(v4."elem1"=69 or v4."elem2"=69) and
v4.v2 between cl.v2-0.8 and cl.v2+0.8 and
v4.v3 between cl.v3-0.8 and cl.v3+0.8 and
v4.v4 between cl.v4-0.8 and cl.v4+0.8 and
v4.v8 between cl.v8-0.8 and cl.v8+0.8 and
v4.v9 between cl.v9-0.8 and cl.v9+0.8 and
v4.v10 between cl.v10-0.8 and cl.v10+0.8